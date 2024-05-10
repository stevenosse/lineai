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

  /// `Please enter at least {minLength} characters.`
  String formInput_minLengthValidation(Object minLength) {
    return Intl.message(
      'Please enter at least $minLength characters.',
      name: 'formInput_minLengthValidation',
      desc: '',
      args: [minLength],
    );
  }

  /// `Passwords do not match.`
  String get formInput_passwordsMissMatch {
    return Intl.message(
      'Passwords do not match.',
      name: 'formInput_passwordsMissMatch',
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

  /// `Sign in with Apple`
  String get login_appleBtnLabel {
    return Intl.message(
      'Sign in with Apple',
      name: 'login_appleBtnLabel',
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

  /// `Sign up with Apple`
  String get register_appleBtnLabel {
    return Intl.message(
      'Sign up with Apple',
      name: 'register_appleBtnLabel',
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

  /// `Forgot your password?`
  String get forgotPassword_title {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotPassword_title',
      desc: '',
      args: [],
    );
  }

  /// `We will send you a link to reset your password.`
  String get forgotPassword_subtitle {
    return Intl.message(
      'We will send you a link to reset your password.',
      name: 'forgotPassword_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get forgotPassword_submitButton {
    return Intl.message(
      'Submit',
      name: 'forgotPassword_submitButton',
      desc: '',
      args: [],
    );
  }

  /// `We have sent you an email with a link to reset your password.`
  String get forgotPassword_successMessage {
    return Intl.message(
      'We have sent you an email with a link to reset your password.',
      name: 'forgotPassword_successMessage',
      desc: '',
      args: [],
    );
  }

  /// `You can request another link in {time} seconds.`
  String forgotPassword_resendMessage(Object time) {
    return Intl.message(
      'You can request another link in $time seconds.',
      name: 'forgotPassword_resendMessage',
      desc: '',
      args: [time],
    );
  }

  /// `Reset your password`
  String get resetPassword_title {
    return Intl.message(
      'Reset your password',
      name: 'resetPassword_title',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new password.`
  String get resetPassword_subtitle {
    return Intl.message(
      'Please enter a new password.',
      name: 'resetPassword_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get resetPassword_submitButton {
    return Intl.message(
      'Submit',
      name: 'resetPassword_submitButton',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been reset successfully.`
  String get resetPassword_successMessage {
    return Intl.message(
      'Your password has been reset successfully.',
      name: 'resetPassword_successMessage',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get resetPassword_passwordLabel {
    return Intl.message(
      'Password',
      name: 'resetPassword_passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `********`
  String get resetPassword_passwordHint {
    return Intl.message(
      '********',
      name: 'resetPassword_passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get resetPassword_confirmPasswordLabel {
    return Intl.message(
      'Confirm Password',
      name: 'resetPassword_confirmPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `********`
  String get resetPassword_confirmPasswordHint {
    return Intl.message(
      '********',
      name: 'resetPassword_confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been reset successfully. You are now logged in.`
  String get resetPassword_success {
    return Intl.message(
      'Your password has been reset successfully. You are now logged in.',
      name: 'resetPassword_success',
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

  /// `Message content copied to clipboard`
  String get chat_copiedToClipboardMessage {
    return Intl.message(
      'Message content copied to clipboard',
      name: 'chat_copiedToClipboardMessage',
      desc: '',
      args: [],
    );
  }

  /// `Copy message`
  String get chat_copyMessage {
    return Intl.message(
      'Copy message',
      name: 'chat_copyMessage',
      desc: '',
      args: [],
    );
  }

  /// `Regenerate`
  String get chat_regenerate {
    return Intl.message(
      'Regenerate',
      name: 'chat_regenerate',
      desc: '',
      args: [],
    );
  }

  /// `Delete message`
  String get chat_deleteMessage {
    return Intl.message(
      'Delete message',
      name: 'chat_deleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Meta-based chatbot. Accuracy, correctness or appropriateness cannot be guaranteed.`
  String get chat_garanteeNotice {
    return Intl.message(
      'Meta-based chatbot. Accuracy, correctness or appropriateness cannot be guaranteed.',
      name: 'chat_garanteeNotice',
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

  /// `Conversation name`
  String get chatSettings_conversationTitleLabel {
    return Intl.message(
      'Conversation name',
      name: 'chatSettings_conversationTitleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Ex: Personal knowledge`
  String get chatSettings_conversationTitleHint {
    return Intl.message(
      'Ex: Personal knowledge',
      name: 'chatSettings_conversationTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Conversation settings updated successfully.`
  String get chatSettings_savedNotification {
    return Intl.message(
      'Conversation settings updated successfully.',
      name: 'chatSettings_savedNotification',
      desc: '',
      args: [],
    );
  }

  /// `Groq API key already set.`
  String get chatSettings_groqApiKeyAlreadySet {
    return Intl.message(
      'Groq API key already set.',
      name: 'chatSettings_groqApiKeyAlreadySet',
      desc: '',
      args: [],
    );
  }

  /// `Delete conversation`
  String get chatSettings_deleteConversationTitle {
    return Intl.message(
      'Delete conversation',
      name: 'chatSettings_deleteConversationTitle',
      desc: '',
      args: [],
    );
  }

  /// `This action cannot be undone.`
  String get chatSettings_deleteConversationSubtitle {
    return Intl.message(
      'This action cannot be undone.',
      name: 'chatSettings_deleteConversationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `This action cannot be undone. Are you sure you want to delete this conversation?`
  String get chatSettings_deleteConversationConfirmation {
    return Intl.message(
      'This action cannot be undone. Are you sure you want to delete this conversation?',
      name: 'chatSettings_deleteConversationConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Conversation deleted successfully.`
  String get chatSettings_deletedNotification {
    return Intl.message(
      'Conversation deleted successfully.',
      name: 'chatSettings_deletedNotification',
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

  /// `Get your API key from `
  String get settings_apiKeyIndications {
    return Intl.message(
      'Get your API key from ',
      name: 'settings_apiKeyIndications',
      desc: '',
      args: [],
    );
  }

  /// `General settings`
  String get settings_generalSettings {
    return Intl.message(
      'General settings',
      name: 'settings_generalSettings',
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

  /// `About`
  String get about_title {
    return Intl.message(
      'About',
      name: 'about_title',
      desc: '',
      args: [],
    );
  }

  /// `This project is NOT backed in any way by Groq Inc`
  String get about_legalNotice {
    return Intl.message(
      'This project is NOT backed in any way by Groq Inc',
      name: 'about_legalNotice',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get about_termsOfUse {
    return Intl.message(
      'Terms of use',
      name: 'about_termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get about_privacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'about_privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Licenses`
  String get about_licenses {
    return Intl.message(
      'Licenses',
      name: 'about_licenses',
      desc: '',
      args: [],
    );
  }

  /// `Please wait...`
  String get loadingDialog_content {
    return Intl.message(
      'Please wait...',
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

  /// `Are you sure?`
  String get confirmDialog_title {
    return Intl.message(
      'Are you sure?',
      name: 'confirmDialog_title',
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

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
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
