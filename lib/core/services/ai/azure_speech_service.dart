import 'package:flutter/services.dart';
import 'package:vitalingu/features/settings/data/model/settings.dart';
import 'package:injectable/injectable.dart';

@injectable
class AzureSpeechService {
  final MicrosoftSpeechSettings _settings;
  static const MethodChannel _channel = MethodChannel('com.example.vitalingu/azure_speech');

  AzureSpeechService({required MicrosoftSpeechSettings settings}) : _settings = settings;

  Future<Uint8List> synthesizeTextSSML({
    required String ssml,
  }) async {
    try {
      final result = await _channel.invokeMethod('synthesizeTextSSML', {
        'apiKey': _settings.apiKey,
        'endpoint': _settings.endpoint,
        'ssml': ssml,
      });
      
      return result as Uint8List; 
    } on PlatformException catch (e) {
      throw Exception('Error en synthesizeTextSSML: ${e.message}');
    }
  }

  Future<String> assessPronunciation({
    required String language, 
    required Uint8List audio,
    String? referenceText,
  }) async {
    try {
      final result = await _channel.invokeMethod('assessPronunciation', {
        'apiKey':  _settings.apiKey,
        'endpoint': _settings.endpoint,
        'language': language, 
        'audio': audio,
        if (referenceText != null) 'referenceText': referenceText,
      });
      
      return result as String;
    } on PlatformException catch (e) {
      throw Exception('Error en assessPronunciation: ${e.message}');
    }
  }

  Future<String> recognizeSpeech({
    required Uint8List audio,
    required List<String> languageCandidates,
  }) async {
    try {
      final result = await _channel.invokeMethod('recognizeSpeech', {
        'apiKey':  _settings.apiKey,
        'endpoint': _settings.endpoint,
        'audio': audio,
        'languageCandidates': languageCandidates,
      });
      
      return result as String;
    } on PlatformException catch (e) {
      throw Exception('Error en recognizeSpeech: ${e.message}');
    }
  }
}