final class AppConstants {
  AppConstants._();

  static const minPasswordLength = 8;
}
final class DBConstants {
  DBConstants._();

  static const String conversationsTable = 'conversations';
  static const String messagesTable = 'messages';
  static const String userSettingsTable = 'user_settings';
}

final class AIConstants {
  AIConstants._();

  static const List<String> models = [
    'mixtral-8x7b-32768',
    'llama3-70b-8192',
    'llama3-8b-8192',
    'gemma-7b-it',
    
  ];

  static const String defaultModel = 'mixtral-8x7b-32768';
}

const chatTips = [
  {
    'title': 'What is',
    'subtitle': 'generative AI ?',
  },
  {
    'title': 'What is large ',
    'subtitle': 'language model (LLM) inference ?',
  },
  {
    'title': 'Why should i care',
    'subtitle': 'about fast inference ?',
  }
];

const groqConsoleApiKeyUrl = 'https://console.groq.com/keys';
