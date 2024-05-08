// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class I18n {
  I18n();

  static I18n? _current;

  static I18n get current {
    assert(_current != null,
        'No instance of I18n was loaded. Try to initialize the I18n delegate before accessing I18n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I18n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I18n();
      I18n._current = instance;

      return instance;
    });
  }

  static I18n of(BuildContext context) {
    final instance = I18n.maybeOf(context);
    assert(instance != null,
        'No instance of I18n present in the widget tree. Did you add I18n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I18n? maybeOf(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  /// `This field is required.`
  String get formInput_required {
    return Intl.message(
      'This field is required.',
      name: 'formInput_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get formInput_emailValidation {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'formInput_emailValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password.`
  String get formInput_passwordValidation {
    return Intl.message(
      'Please enter a password.',
      name: 'formInput_passwordValidation',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get welcome_getStarted {
    return Intl.message(
      'Get Started',
      name: 'welcome_getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get welcome_signIn {
    return Intl.message(
      'Sign In',
      name: 'welcome_signIn',
      desc: '',
      args: [],
    );
  }

  /// `LineAI`
  String get welcome_title {
    return Intl.message(
      'LineAI',
      name: 'welcome_title',
      desc: '',
      args: [],
    );
  }

  /// `The best free & open source ChatGPT alternative.`
  String get welcome_subtitle {
    return Intl.message(
      'The best free & open source ChatGPT alternative.',
      name: 'welcome_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get login_title {
    return Intl.message(
      'Log In',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `To continue, log in to your account.`
  String get login_subtitle {
    return Intl.message(
      'To continue, log in to your account.',
      name: 'login_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_btnLabel {
    return Intl.message(
      'Login',
      name: 'login_btnLabel',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get login_emailLabel {
    return Intl.message(
      'Email',
      name: 'login_emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `hello@adaptiv.io`
  String get login_emailHint {
    return Intl.message(
      'hello@adaptiv.io',
      name: 'login_emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_passwordLabel {
    return Intl.message(
      'Password',
      name: 'login_passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `********`
  String get login_passwordHint {
    return Intl.message(
      '********',
      name: 'login_passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get login_googleBtnLabel {
    return Intl.message(
      'Sign in with Google',
      name: 'login_googleBtnLabel',
      desc: '',
      args: [],
    );
  }

  /// `By logging in, you agree to our`
  String get login_termsLabel {
    return Intl.message(
      'By logging in, you agree to our',
      name: 'login_termsLabel',
      desc: '',
      args: [],
    );
  }

  /// `terms of service`
  String get login_termsLink {
    return Intl.message(
      'terms of service',
      name: 'login_termsLink',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get login_forgotPasswordLabel {
    return Intl.message(
      'Forgot your password?',
      name: 'login_forgotPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get register_title {
    return Intl.message(
      'Sign Up',
      name: 'register_title',
      desc: '',
      args: [],
    );
  }

  /// `You need an account to continue.`
  String get register_subtitle {
    return Intl.message(
      'You need an account to continue.',
      name: 'register_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get register_btnLabel {
    return Intl.message(
      'Sign Up',
      name: 'register_btnLabel',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get register_emailLabel {
    return Intl.message(
      'Email',
      name: 'register_emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `hello@adaptiv.io`
  String get register_emailHint {
    return Intl.message(
      'hello@adaptiv.io',
      name: 'register_emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get register_passwordLabel {
    return Intl.message(
      'Password',
      name: 'register_passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `********`
  String get register_passwordHint {
    return Intl.message(
      '********',
      name: 'register_passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with Google`
  String get register_googleBtnLabel {
    return Intl.message(
      'Sign up with Google',
      name: 'register_googleBtnLabel',
      desc: '',
      args: [],
    );
  }

  /// `By signing up, you agree to our`
  String get register_termsLabel {
    return Intl.message(
      'By signing up, you agree to our',
      name: 'register_termsLabel',
      desc: '',
      args: [],
    );
  }

  /// `terms of service`
  String get register_termsLink {
    return Intl.message(
      'terms of service',
      name: 'register_termsLink',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get register_forgotPasswordLabel {
    return Intl.message(
      'Forgot your password?',
      name: 'register_forgotPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email`
  String get pendingVerification_title {
    return Intl.message(
      'Verify your email',
      name: 'pendingVerification_title',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email and click on the link to verify your account.`
  String get pendingVerification_subtitle {
    return Intl.message(
      'Please check your email and click on the link to verify your account.',
      name: 'pendingVerification_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get pendingVerification_resendButton {
    return Intl.message(
      'Resend',
      name: 'pendingVerification_resendButton',
      desc: '',
      args: [],
    );
  }

  /// `New conversation`
  String get drawer_newConversation {
    return Intl.message(
      'New conversation',
      name: 'drawer_newConversation',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get drawer_searchHint {
    return Intl.message(
      'Search',
      name: 'drawer_searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get drawer_settings {
    return Intl.message(
      'Settings',
      name: 'drawer_settings',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get drawer_about {
    return Intl.message(
      'About',
      name: 'drawer_about',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get drawer_chatsSectionTitle {
    return Intl.message(
      'Chats',
      name: 'drawer_chatsSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `No conversations yet`
  String get drawer_noConversations {
    return Intl.message(
      'No conversations yet',
      name: 'drawer_noConversations',
      desc: '',
      args: [],
    );
  }

  /// `Create a workout plan`
  String get chat_tips_title {
    return Intl.message(
      'Create a workout plan',
      name: 'chat_tips_title',
      desc: '',
      args: [],
    );
  }

  /// `for weight loss`
  String get chat_tips_subtitle {
    return Intl.message(
      'for weight loss',
      name: 'chat_tips_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Message...`
  String get chat_inputPlaceholder {
    return Intl.message(
      'Message...',
      name: 'chat_inputPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a message.`
  String get chat_messageRequiredValidation {
    return Intl.message(
      'Please enter a message.',
      name: 'chat_messageRequiredValidation',
      desc: '',
      args: [],
    );
  }

  /// `Unnamed conversation`
  String get chat_unnamedConversation {
    return Intl.message(
      'Unnamed conversation',
      name: 'chat_unnamedConversation',
      desc: '',
      args: [],
    );
  }

  /// `AI Assistant`
  String get chat_aiAssistant {
    return Intl.message(
      'AI Assistant',
      name: 'chat_aiAssistant',
      desc: '',
      args: [],
    );
  }

  /// `Chat settings`
  String get chatSettings_title {
    return Intl.message(
      'Chat settings',
      name: 'chatSettings_title',
      desc: '',
      args: [],
    );
  }

  /// `Model`
  String get chatSettings_modelLabel {
    return Intl.message(
      'Model',
      name: 'chatSettings_modelLabel',
      desc: '',
      args: [],
    );
  }

  /// `System prompt`
  String get chatSettings_systemPromptLabel {
    return Intl.message(
      'System prompt',
      name: 'chatSettings_systemPromptLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please provide useful, helpful and actionnable answers.`
  String get chatSettings_systemPromptHint {
    return Intl.message(
      'Please provide useful, helpful and actionnable answers.',
      name: 'chatSettings_systemPromptHint',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get chatSettings_temperatureLabel {
    return Intl.message(
      'Temperature',
      name: 'chatSettings_temperatureLabel',
      desc: '',
      args: [],
    );
  }

  /// `Between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.`
  String get chatSettings_temperatureHint {
    return Intl.message(
      'Between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.',
      name: 'chatSettings_temperatureHint',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_title {
    return Intl.message(
      'Settings',
      name: 'settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Groq API key`
  String get settings_groqApiKeyLabel {
    return Intl.message(
      'Groq API key',
      name: 'settings_groqApiKeyLabel',
      desc: '',
      args: [],
    );
  }

  /// `gsk_********************`
  String get settings_groqApiKeyHint {
    return Intl.message(
      'gsk_********************',
      name: 'settings_groqApiKeyHint',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get settings_logout {
    return Intl.message(
      'Logout',
      name: 'settings_logout',
      desc: '',
      args: [],
    );
  }

  /// `Logout failed`
  String get settings_logoutFailedTitle {
    return Intl.message(
      'Logout failed',
      name: 'settings_logoutFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while logging out. Please try again.`
  String get settings_logoutFailedBody {
    return Intl.message(
      'An error occurred while logging out. Please try again.',
      name: 'settings_logoutFailedBody',
      desc: '',
      args: [],
    );
  }

  /// `Please provide a groq API key in the settings.`
  String get settings_groqApiKeyError {
    return Intl.message(
      'Please provide a groq API key in the settings.',
      name: 'settings_groqApiKeyError',
      desc: '',
      args: [],
    );
  }

  /// `Please provide a groq API key.`
  String get settings_groqApiKeyRequiredValidation {
    return Intl.message(
      'Please provide a groq API key.',
      name: 'settings_groqApiKeyRequiredValidation',
      desc: '',
      args: [],
    );
  }

  /// `Settings saved successfully.`
  String get settings_groqApiKeySuccess {
    return Intl.message(
      'Settings saved successfully.',
      name: 'settings_groqApiKeySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loadingDialog_content {
    return Intl.message(
      'Loading...',
      name: 'loadingDialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address or password`
  String get login_error_400 {
    return Intl.message(
      'Invalid email address or password',
      name: 'login_error_400',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Please try again.`
  String get login_error_default {
    return Intl.message(
      'An error occurred. Please try again.',
      name: 'login_error_default',
      desc: '',
      args: [],
    );
  }

  /// `Oops!`
  String get errorDialog_title {
    return Intl.message(
      'Oops!',
      name: 'errorDialog_title',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get errorNotification_title {
    return Intl.message(
      'An error occurred',
      name: 'errorNotification_title',
      desc: '',
      args: [],
    );
  }

  /// `Yay!`
  String get successNotification_title {
    return Intl.message(
      'Yay!',
      name: 'successNotification_title',
      desc: '',
      args: [],
    );
  }

  /// `We are unable to connect to the internet. Please check your connection and try again.`
  String get error_noInternet {
    return Intl.message(
      'We are unable to connect to the internet. Please check your connection and try again.',
      name: 'error_noInternet',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Please try again.`
  String get error_server {
    return Intl.message(
      'An error occurred. Please try again.',
      name: 'error_server',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Please try again.`
  String get error_unknown {
    return Intl.message(
      'An error occurred. Please try again.',
      name: 'error_unknown',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Please try again.`
  String get error_notFound {
    return Intl.message(
      'An error occurred. Please try again.',
      name: 'error_notFound',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I18n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
