import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/settings.dart';
import 'package:fpdart/fpdart.dart';

class ChatMessage {
  final String role; 
  final String text;

  ChatMessage({required this.role, required this.text});

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'parts': [
        {'text': text}
      ]
    };
  }
}

class ChatHistory {
  final List<ChatMessage> _messages = [];

  void addUserMessage(String text) {
    _messages.add(ChatMessage(role: 'user', text: text));
  }

  void addModelMessage(String text) {
    _messages.add(ChatMessage(role: 'model', text: text));
  }

  void clear() {
    _messages.clear();
  }

  List<ChatMessage> get messages => List.unmodifiable(_messages);

  List<Map<String, dynamic>> toJson() {
    return _messages.map((msg) => msg.toJson()).toList();
  }
}

class GeminiApiException implements Exception {
  final String message;
  final int statusCode;
  final String responseBody;

  GeminiApiException({
    required this.message,
    required this.statusCode,
    required this.responseBody,
  });

  @override
  String toString() => 'GeminiApiException: $message (Status: $statusCode)';
}

class GeminiParseException implements Exception {
  final String message;

  GeminiParseException(this.message);

  @override
  String toString() => 'GeminiParseException: $message';
}

@injectable
class GeminiPromptService {
  static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta';
  static const String _model = 'gemini-2.5-flash-lite';
  final GeminiSettings _geminiSettings;

  GeminiPromptService({required GeminiSettings geminiSettings}) : _geminiSettings = geminiSettings;



  Future<Either<Exception, String>> generatePrompt(
    String prompt, {
    String? systemInstruction,
  }) async {
    final contents = [
      {
        'parts': [
          {'text': prompt}
        ]
      }
    ];

    return _callApi(contents, systemInstruction);
  }

  Future<Either<Exception, ChatHistory>> generatePromptWithChat(
    String prompt,
    ChatHistory chatHistory, {
    String? systemInstruction,
  }) async {
    final contents = [
      ...chatHistory.toJson(),
      {
        'role': 'user',
        'parts': [
          {'text': prompt}
        ]
      }
    ];

    return (await _callApi(contents, systemInstruction)).fold(
      (exception) => Left(exception),
      (generatedText) {
        chatHistory.addUserMessage(prompt);
        chatHistory.addModelMessage(generatedText);
        return Right(chatHistory);
      },
    );
  }

  Future<Either<Exception, String>> _callApi(
    List<Map<String, dynamic>> contents,
    String? systemInstruction,
  ) async {
    return TaskEither<Exception, String>.tryCatch(
      () async {
        final url = Uri.parse('$_baseUrl/models/$_model:generateContent');
        
        final Map<String, dynamic> body = {'contents': contents};

        if (systemInstruction != null) {
          body['system_instruction'] = {
            'parts': [
              {'text': systemInstruction}
            ]
          };
        }

        final response = await http.post(
          url,
          headers: {
            'x-goog-api-key': _geminiSettings.apiKey,
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final text = data['candidates']?[0]?['content']?['parts']?[0]?['text'];
          
          if (text == null) {
            throw GeminiParseException('Unable to parse response: missing text field');
          }
          
          return text as String;
        } else {
          throw GeminiApiException(
            message: 'Error generating content',
            statusCode: response.statusCode,
            responseBody: response.body,
          );
        }
      },
      (error, stackTrace) {
        if (error is GeminiApiException || error is GeminiParseException) {
          return error as Exception;
        }
        return Exception('Unexpected error: $error');
      },
    ).run();
  }
}