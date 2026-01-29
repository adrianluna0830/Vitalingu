import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/core/models/ai_client.dart';
import 'package:vitalingu/core/models/chat_conversation.dart';
import 'package:vitalingu/core/models/user_app_settings.dart';

@Singleton(as: AiClient)
class GeminiAiClient implements AiClient {
  final Dio _dio;
  final GeminiApiKeySignal _apiKeySignal;

  GeminiAiClient(this._dio, this._apiKeySignal);

  String get endpoint =>
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent';

  @override
  Future<String> sendMessage(String message) async {
    final apiKey = _apiKeySignal.value;

    if (apiKey.isEmpty) {
      throw Exception(
        'Gemini API Key is missing. Please configure it in settings.',
      );
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
                {"text": message},
              ],
            },
          ],
        },
      );

      return _parseResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ChatConversation> sendMessageFromConversation(
    ChatConversation conversation,
  ) async {
    final apiKey = _apiKeySignal.value;
    if (apiKey.isEmpty) {
      throw Exception(
        'Gemini API Key is missing. Please configure it in settings.',
      );
    }

    final contents = conversation.allMessages.map((msg) {
      return {
        "role": msg.role,
        "parts": [
          {"text": msg.content},
        ],
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
        data: {"contents": contents},
      );
      final responseText = _parseResponse(response);
      conversation.addModelMessage(responseText);
      return conversation;
    } catch (e) {
      rethrow;
    }
  }

  String _parseResponse(Response response) {
    if (response.statusCode != 200) {
      throw Exception('Gemini API returned status code ${response.statusCode}');
    }

    final data = response.data;
    if (data == null) {
      throw Exception('Gemini API returned empty data');
    }

    final candidates = data['candidates'] as List?;
    if (candidates == null || candidates.isEmpty) {
      throw Exception('Gemini API returned no candidates');
    }

    final firstCandidate = candidates[0];
    final content = firstCandidate['content'];
    if (content == null) {
      throw Exception('Gemini API candidate has no content');
    }

    final parts = content['parts'] as List?;
    if (parts == null || parts.isEmpty) {
      throw Exception('Gemini API content has no parts');
    }

    final firstPart = parts[0];
    final text = firstPart['text'] as String?;
    if (text == null) {
      throw Exception('Gemini API part has no text');
    }
    return text;
  }
  
  @override
  Future<String> thinkAndSendMessage(String message) async {
 final apiKey = _apiKeySignal.value;

    if (apiKey.isEmpty) {
      throw Exception(
        'Gemini API Key is missing. Please configure it in settings.',
      );
    }

    try {
      final response = await _dio.post(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-pro:generateContent',
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
                {"text": message},
              ],
            },
          ],
        },
      );

      return _parseResponse(response);
    } catch (e) {
      rethrow;
    }
  }
}
