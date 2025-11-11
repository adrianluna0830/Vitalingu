import 'dart:convert';
import 'package:http/http.dart' as http;

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

class GeminiPromptService {
  static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta';
  static const String _model = 'gemini-2.5-flash-lite';
  late final String _apiKey;

  GeminiPromptService._();

  static Future<GeminiPromptService> initialize({required String apiKey}) async {
    final instance = GeminiPromptService._();
    instance._apiKey = apiKey;
    return instance;
  }

  Future<String> generatePrompt(
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

  Future<ChatHistory> generatePromptWithChat(
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

    final generatedText = await _callApi(contents, systemInstruction);
    
    chatHistory.addUserMessage(prompt);
    chatHistory.addModelMessage(generatedText);
    
    return chatHistory; 
  }

  Future<String> _callApi(
    List<Map<String, dynamic>> contents,
    String? systemInstruction,
  ) async {
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
        'x-goog-api-key': _apiKey,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['candidates'][0]['content']['parts'][0]['text'];
    } else {
      throw Exception('Error generating content: ${response.body}');
    }
  }
}