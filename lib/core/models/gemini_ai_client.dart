import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/core/models/ai_client.dart';
import 'package:vitalingu/core/models/chat_conversation.dart';
import 'package:vitalingu/core/models/result.dart';
import 'package:vitalingu/core/models/user_app_settings.dart';

@Singleton(as: AiClient)
class GeminiAiClient implements AiClient {
  final Dio _dio;
  final GeminiApiKeySignal _apiKeySignal;

  GeminiAiClient(this._dio, this._apiKeySignal);

  String  endpoint ='https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent';

  String _parseResponse(Response response) {
    if (response.statusCode != 200) {
      throw AIRequestException('Gemini API returned status code ${response.statusCode}');
    }

    final data = response.data;
    if (data == null) {
      throw AIRequestException('Gemini API returned empty data');
    }

    final candidates = data['candidates'] as List?;
    if (candidates == null || candidates.isEmpty) {
      throw AIRequestException('Gemini API returned no candidates');
    }

    final firstCandidate = candidates[0];
    final content = firstCandidate['content'];
    if (content == null) {
      throw AIRequestException('Gemini API candidate has no content');
    }

    final parts = content['parts'] as List?;
    if (parts == null || parts.isEmpty) {
      throw AIRequestException('Gemini API content has no parts');
    }

    final firstPart = parts[0];
    final text = firstPart['text'] as String?;
    if (text == null) {
      throw AIRequestException('Gemini API part has no text');
    }
    return text;
  }

  Future<Result<AIClientException, String>> _performRequest({
    required List<Map<String, dynamic>> contents,
    String? systemInstructions,
    Map<String, dynamic>? outputJsonSchema,
    bool think = false,
  }) async {
    final apiKey = _apiKeySignal.value;

    if (apiKey.isEmpty) {
      return Err(AIConfigurationException(
          'Gemini API Key is missing. Please configure it in settings.'));
    }

    final Map<String, dynamic> body = {
      "contents": contents,
    };

    if (systemInstructions != null && systemInstructions.isNotEmpty) {
      body['system_instruction'] = {
        "parts": [
          {"text": systemInstructions}
        ]
      };
    }

    final Map<String, dynamic> generationConfig = {};
    if (outputJsonSchema != null && outputJsonSchema.isNotEmpty) {
      generationConfig["responseMimeType"] = "application/json";
      generationConfig["responseJsonSchema"] = outputJsonSchema;
    }

    if (think) {
      generationConfig["thinkingConfig"] = {
        "thinkingBudget": 1024,
      };
    }

    if (generationConfig.isNotEmpty) {
      body['generationConfig'] = generationConfig;
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
        data: body,
      );

      return Ok(_parseResponse(response));
    } catch (e) {
      if (e is AIClientException) {
        return Err(e);
      }
      return Err(AIRequestException(e.toString()));
    }
  }

  @override
  Future<Result<AIClientException, ChatConversation>> generateChatResponse(
      ChatConversation conversation,
      {String? systemInstructions,
      Map<String, dynamic>? outputJsonSchema,
      bool think = false}) async {
    final contents = conversation.allMessages.map((msg) {
      return {
        "role": msg.role,
        "parts": [
          {"text": msg.content}
        ]
      };
    }).toList();

    final result = await _performRequest(
      contents: contents,
      systemInstructions: systemInstructions,
      outputJsonSchema: outputJsonSchema,
      think: think,
    );

    return switch (result) {
      Ok(:final value) => Ok(conversation..addModelMessage(value)),
      Err(:final error) => Err(error),
    };
  }

  @override
  Future<Result<AIClientException, String>> generateContent(String prompt,
      {String? systemInstructions,
      Map<String, dynamic>? outputJsonSchema,
      bool think = false}) async {
    return _performRequest(
      contents: [
        {
          "role": "user",
          "parts": [
            {"text": prompt},
          ],
        },
      ],
      systemInstructions: systemInstructions,
      outputJsonSchema: outputJsonSchema,
      think: think,
    );
  }
}

