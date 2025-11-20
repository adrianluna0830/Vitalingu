package com.example.vitalingu

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.util.Log
import com.microsoft.cognitiveservices.speech.*
import com.microsoft.cognitiveservices.speech.audio.*
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.vitalingu/azure_speech"
    
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            try {
                when (call.method) {
                    "synthesizeTextSSML" -> {
                        val apiKey = call.argument<String>("apiKey")!!
                        val endpoint = call.argument<String>("endpoint")!!
                        val ssml = call.argument<String>("ssml")!!
                        
                        val audioBytes = synthesizeTextSSML(apiKey, endpoint, ssml)
                        result.success(audioBytes)
                    }
                    
                    "assessPronunciation" -> {
                        val apiKey = call.argument<String>("apiKey")!!
                        val endpoint = call.argument<String>("endpoint")!!
                        val language = call.argument<String>("language")!!
                        val audio = call.argument<ByteArray>("audio")!!
                        val referenceText = call.argument<String>("referenceText")
                        
                        val assessmentResult = assessPronunciation(apiKey, endpoint, language, audio, referenceText)
                        result.success(assessmentResult)
                    }
                    
                    "recognizeSpeech" -> {
                        val apiKey = call.argument<String>("apiKey")!!
                        val endpoint = call.argument<String>("endpoint")!!
                        val audio = call.argument<ByteArray>("audio")!!
                        val languageCandidates = call.argument<List<String>>("languageCandidates")!!
                        
                        val recognitionResult = recognizeSpeech(apiKey, endpoint, audio, languageCandidates)
                        result.success(recognitionResult)
                    }
                    
                    else -> {
                        result.notImplemented()
                    }
                }
            } catch (e: Exception) {
                Log.e("MainActivity", "Error: ${e.message}", e)
                result.error("ERROR", e.message, null)
            }
        }
    }
    
    private fun synthesizeTextSSML(apiKey: String, endpoint: String, ssml: String): ByteArray {
        Log.d("MainActivity", "synthesizeTextSSML called")
        
        val speechConfig = SpeechConfig.fromEndpoint(
            java.net.URI.create(endpoint),
            apiKey
        )
        
        val speechSynthesizer = SpeechSynthesizer(speechConfig, null)
        
        try {
            val speechSynthesisResult = speechSynthesizer.SpeakSsmlAsync(ssml).get()
            
            if (speechSynthesisResult.reason == ResultReason.SynthesizingAudioCompleted) {
                val audioData = speechSynthesisResult.audioData
                speechSynthesisResult.close()
                return audioData
            } else if (speechSynthesisResult.reason == ResultReason.Canceled) {
                val cancellation = SpeechSynthesisCancellationDetails.fromResult(speechSynthesisResult)
                speechSynthesisResult.close()
                
                if (cancellation.reason == CancellationReason.Error) {
                    throw Exception("CANCELED: ErrorCode=${cancellation.errorCode}, ErrorDetails=${cancellation.errorDetails}")
                } else {
                    throw Exception("CANCELED: Reason=${cancellation.reason}")
                }
            } else {
                speechSynthesisResult.close()
                throw Exception("Speech synthesis failed with reason: ${speechSynthesisResult.reason}")
            }
        } finally {
            speechSynthesizer.close()
            speechConfig.close()
        }
    }
    
    private fun assessPronunciation(
        apiKey: String, 
        endpoint: String, 
        language: String, 
        audio: ByteArray, 
        referenceText: String?
    ): String {
        Log.d("MainActivity", "assessPronunciation called")
        
        val speechConfig = SpeechConfig.fromEndpoint(
            java.net.URI.create(endpoint),
            apiKey
        )
        speechConfig.speechRecognitionLanguage = language
        
        val audioFormat = AudioStreamFormat.getWaveFormatPCM(16000, 16.toShort(), 1.toShort())
        val audioInputStream = AudioInputStream.createPushStream(audioFormat)
        val audioConfig = AudioConfig.fromStreamInput(audioInputStream)
        
        val pronunciationConfig = if (referenceText != null && referenceText.isNotEmpty()) {
            PronunciationAssessmentConfig(
                referenceText,
                PronunciationAssessmentGradingSystem.HundredMark,
                PronunciationAssessmentGranularity.Phoneme,
                true
            )
        } else {
            PronunciationAssessmentConfig(
                "",
                PronunciationAssessmentGradingSystem.HundredMark,
                PronunciationAssessmentGranularity.Phoneme,
                false
            )
        }
        
        pronunciationConfig.enableProsodyAssessment()
        
        val speechRecognizer = SpeechRecognizer(speechConfig, audioConfig)
        pronunciationConfig.applyTo(speechRecognizer)
        
        try {
            audioInputStream.write(audio)
            audioInputStream.close()
            
            val speechRecognitionResult = speechRecognizer.recognizeOnceAsync().get()
            
            if (speechRecognitionResult.reason == ResultReason.RecognizedSpeech) {
                val jsonResult = speechRecognitionResult.properties.getProperty(PropertyId.SpeechServiceResponse_JsonResult)
                speechRecognitionResult.close()
                return jsonResult
            } else if (speechRecognitionResult.reason == ResultReason.NoMatch) {
                speechRecognitionResult.close()
                throw Exception("NOMATCH: Speech could not be recognized.")
            } else if (speechRecognitionResult.reason == ResultReason.Canceled) {
                val cancellation = CancellationDetails.fromResult(speechRecognitionResult)
                speechRecognitionResult.close()
                
                if (cancellation.reason == CancellationReason.Error) {
                    throw Exception("CANCELED: ErrorCode=${cancellation.errorCode}, ErrorDetails=${cancellation.errorDetails}")
                } else {
                    throw Exception("CANCELED: Reason=${cancellation.reason}")
                }
            } else {
                speechRecognitionResult.close()
                throw Exception("Speech recognition failed with reason: ${speechRecognitionResult.reason}")
            }
        } finally {
            speechRecognizer.close()
            speechConfig.close()
            audioConfig.close()
            pronunciationConfig.close()
        }
    }
    
    private fun recognizeSpeech(
        apiKey: String, 
        endpoint: String, 
        audio: ByteArray, 
        languageCandidates: List<String>
    ): String {
        Log.d("MainActivity", "recognizeSpeech called")
        
        val speechConfig = SpeechConfig.fromEndpoint(
            java.net.URI.create(endpoint),
            apiKey
        )
        
        val autoDetectSourceLanguageConfig = AutoDetectSourceLanguageConfig.fromLanguages(languageCandidates)
        
        val audioFormat = AudioStreamFormat.getWaveFormatPCM(16000, 16.toShort(), 1.toShort())
        val audioInputStream = AudioInputStream.createPushStream(audioFormat)
        val audioConfig = AudioConfig.fromStreamInput(audioInputStream)
        
        val speechRecognizer = SpeechRecognizer(
            speechConfig,
            autoDetectSourceLanguageConfig,
            audioConfig
        )
        
        try {
            audioInputStream.write(audio)
            audioInputStream.close()
            
            val speechRecognitionResult = speechRecognizer.recognizeOnceAsync().get()
            
            if (speechRecognitionResult.reason == ResultReason.RecognizedSpeech) {
                val jsonResult = speechRecognitionResult.properties.getProperty(PropertyId.SpeechServiceResponse_JsonResult)
                speechRecognitionResult.close()
                return jsonResult
            } else if (speechRecognitionResult.reason == ResultReason.NoMatch) {
                speechRecognitionResult.close()
                throw Exception("NOMATCH: Speech could not be recognized.")
            } else if (speechRecognitionResult.reason == ResultReason.Canceled) {
                val cancellation = CancellationDetails.fromResult(speechRecognitionResult)
                speechRecognitionResult.close()
                
                if (cancellation.reason == CancellationReason.Error) {
                    throw Exception("CANCELED: ErrorCode=${cancellation.errorCode}, ErrorDetails=${cancellation.errorDetails}")
                } else {
                    throw Exception("CANCELED: Reason=${cancellation.reason}")
                }
            } else {
                speechRecognitionResult.close()
                throw Exception("Speech recognition failed with reason: ${speechRecognitionResult.reason}")
            }
        } finally {
            speechRecognizer.close()
            speechConfig.close()
            autoDetectSourceLanguageConfig.close()
            audioConfig.close()
        }
    }
}