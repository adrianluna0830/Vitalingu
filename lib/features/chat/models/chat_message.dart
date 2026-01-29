class ChatMessage {
  final String content;
  final String role;
  final bool isUserMessage;

  ChatMessage({required this.content, required this.role, required this.isUserMessage});

  Map<String, dynamic> toJson()
  {
    return {
      'content': content,
      'role': role,
    };
  }
}
