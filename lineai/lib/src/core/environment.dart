class Environment {
  static const String appName = String.fromEnvironment('app_name', defaultValue: 'Line AI');
  static const String environment = String.fromEnvironment('env', defaultValue: 'dev');

  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const String supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  static const String privacyPolicyUrl = 'https://github.com/stevenosse/lineai/blob/main/docs/PRIVACY_POLICY.MD';
  static const String termsOfServiceUrl = 'https://github.com/stevenosse/lineai/blob/main/docs/TERMS_OF_USE.MD';

  static const feedbackUrl = 'https://github.com/stevenosse/lineai/issues';
}
