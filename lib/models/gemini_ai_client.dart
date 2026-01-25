import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/chat_conversation.dart';
import 'package:vitalingu/models/user_app_settings.dart';

@singleton
class GeminiAiClient  {
  final Dio _dio;
  final GeminiApiKeySignal _apiKeySignal;

  GeminiAiClient(this._dio, this._apiKeySignal);

  String get endpoint =>
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent';

  Future<String?> sendMessage(String message) async {
    final apiKey = _apiKeySignal.value;
    
    if (apiKey.isEmpty) {
      throw Exception('Gemini API Key is missing. Please configure it in settings.');
    }

    try {
      final response = await _dio.post(
        endpoint,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-goog-api-key': apiKey,
          },
        ),
        data: {
          "contents": [
            {
              "parts": [
                {"text": message}
              ]
            }
          ]
        },
      );

      return _parseResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> sendMessageFromConversation(
      ChatConversation conversation) async {
    final apiKey = _apiKeySignal.value;
    if (apiKey.isEmpty) {
      throw Exception(
          'Gemini API Key is missing. Please configure it in settings.');
    }

    final contents = conversation.allMessages.map((msg) {
      return {
        "role": msg.role,
        "parts": [
          {"text": msg.content}
        ]
      };
    }).toList();

    try {
      final response = await _dio.post(
        endpoint,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-goog-api-key': apiKey,
          },
        ),
        data: {
          "contents": contents,
        },
      );

      return _parseResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  String? _parseResponse(Response response) {
    if (response.statusCode != 200) return null;

    final data = response.data;
    if (data == null) return null;

    final candidates = data['candidates'] as List?;
    if (candidates == null || candidates.isEmpty) return null;

    final firstCandidate = candidates[0];
    final content = firstCandidate['content'];
    if (content == null) return null;

    final parts = content['parts'] as List?;
    if (parts == null || parts.isEmpty) return null;

    final firstPart = parts[0];
    return firstPart['text'];
  }
}
