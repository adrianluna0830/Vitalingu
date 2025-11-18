import 'package:flutter/services.dart';
import 'package:vitalingu/models/settings.dart';
class AzureSpeechService {
  final MicrosoftSpeechSettings settings;
  static const MethodChannel _channel = MethodChannel('com.example.vitalingu/azure_speech');

  AzureSpeechService({required this.settings});

   Future<Uint8List> synthesi1zeTextSSML({
    required String apiKey,
    required String endpoint,
    required String ssml,
  }) async {
    try {
      final result = await _channel.invokeMethod('synthesizeTextSSML', {
        'apiKey': settings.apiKey,
        'endpoint': settings.endpoint,
        'ssml': ssml,
      });
      
      return Uint8List.fromList(List<int>.from(result));
    } on PlatformException catch (e) {
      throw Exception('Error en synthesizeTextSSML: ${e.message}');
    }
  }

   Future<String> assessPronunciation({
    required String voice,
    required Uint8List audio,
    String? referenceText,
  }) async {
    try {
      final result = await _channel.invokeMethod('assessPronunciation', {
        'apiKey':  settings.apiKey,
        'endpoint': settings.endpoint,
        'voice': voice,
        'audio': audio,
        if (referenceText != null) 'referenceText': referenceText,
      });
      
      return result as String;
    } on PlatformException catch (e) {
      throw Exception('Error en assessPronunciation: ${e.message}');
    }
  }

   Future<String> recognizeSpeech({
    required String voice,
    required Uint8List audio,
    required List<String> languageCandidates,
  }) async {
    try {
      final result = await _channel.invokeMethod('recognizeSpeech', {
        'apiKey':  settings.apiKey,
        'endpoint': settings.endpoint,
        'voice': voice,
        'audio': audio,
        'languageCandidates': languageCandidates,
      });
      
      return result as String;
    } on PlatformException catch (e) {
      throw Exception('Error en recognizeSpeech: ${e.message}');
    }
  }

  static Future<String> fastTranscription({
    required String apiKey,
    required String endpoint,
    required String voice,
    required Uint8List audio,
    required String locale,
  }) async {
    try {
      final result = await _channel.invokeMethod('fastTranscription', {
        'apiKey': apiKey,
        'endpoint': endpoint,
        'voice': voice,
        'audio': audio,
        'locale': locale,
      });
      
      return result as String;
    } on PlatformException catch (e) {
      throw Exception('Error en fastTranscription: ${e.message}');
    }
  }
}