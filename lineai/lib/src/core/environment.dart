class Environment {
  static const String appName = String.fromEnvironment('app_name', defaultValue: 'Line AI');
  static const String environment = String.fromEnvironment('env', defaultValue: 'dev');

  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const String supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  static const String forgotPasswordCallbackUrl = String.fromEnvironment(
    'FORGOT_PASSWORD_CALLBACK_URL',
    defaultValue: 'io.adaptiv.lineai://reset-password-callback',
  );
}
