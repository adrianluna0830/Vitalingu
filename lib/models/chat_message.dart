class ChatMessage {
  final String content;
  final String role;

  ChatMessage({required this.content, required this.role});

  Map<String, dynamic> toJson()
  {
    return {
      'content': content,
      'role': role,
    };
  }
}
