final class DBConstants {
  DBConstants._();
  
  static const String conversationsTable = 'conversations';
  static const String messagesTable = 'messages';
}

final class AIConstants {
  AIConstants._();
  
  static const List<String> models = [
    'llama3-8b-8192',
    'gemma-7b-it',
    'mixtral-8x7b-32768',
  ];
}