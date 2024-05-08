// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "chatSettings_modelLabel":
            MessageLookupByLibrary.simpleMessage("Model"),
        "chatSettings_systemPromptHint": MessageLookupByLibrary.simpleMessage(
            "Please provide useful, helpful and actionnable answers."),
        "chatSettings_systemPromptLabel":
            MessageLookupByLibrary.simpleMessage("System prompt"),
        "chatSettings_temperatureHint": MessageLookupByLibrary.simpleMessage(
            "Between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic."),
        "chatSettings_temperatureLabel":
            MessageLookupByLibrary.simpleMessage("Temperature"),
        "chatSettings_title":
            MessageLookupByLibrary.simpleMessage("Chat settings"),
        "chat_aiAssistant":
            MessageLookupByLibrary.simpleMessage("AI Assistant"),
        "chat_inputPlaceholder":
            MessageLookupByLibrary.simpleMessage("Message..."),
        "chat_messageRequiredValidation":
            MessageLookupByLibrary.simpleMessage("Please enter a message."),
        "chat_tips_subtitle":
            MessageLookupByLibrary.simpleMessage("for weight loss"),
        "chat_tips_title":
            MessageLookupByLibrary.simpleMessage("Create a workout plan"),
        "chat_unnamedConversation":
            MessageLookupByLibrary.simpleMessage("Unnamed conversation"),
        "drawer_about": MessageLookupByLibrary.simpleMessage("About"),
        "drawer_chatsSectionTitle":
            MessageLookupByLibrary.simpleMessage("Chats"),
        "drawer_newConversation":
            MessageLookupByLibrary.simpleMessage("New conversation"),
        "drawer_noConversations":
            MessageLookupByLibrary.simpleMessage("No conversations yet"),
        "drawer_searchHint": MessageLookupByLibrary.simpleMessage("Search"),
        "drawer_settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "errorDialog_title": MessageLookupByLibrary.simpleMessage("Oops!"),
        "errorNotification_title":
            MessageLookupByLibrary.simpleMessage("An error occurred"),
        "error_noInternet": MessageLookupByLibrary.simpleMessage(
            "We are unable to connect to the internet. Please check your connection and try again."),
        "error_notFound": MessageLookupByLibrary.simpleMessage(
            "An error occurred. Please try again."),
        "error_server": MessageLookupByLibrary.simpleMessage(
            "An error occurred. Please try again."),
        "error_unknown": MessageLookupByLibrary.simpleMessage(
            "An error occurred. Please try again."),
        "formInput_emailValidation": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid email address."),
        "formInput_passwordValidation":
            MessageLookupByLibrary.simpleMessage("Please enter a password."),
        "formInput_required":
            MessageLookupByLibrary.simpleMessage("This field is required."),
        "loadingDialog_content":
            MessageLookupByLibrary.simpleMessage("Loading..."),
        "login_btnLabel": MessageLookupByLibrary.simpleMessage("Login"),
        "login_emailHint":
            MessageLookupByLibrary.simpleMessage("hello@adaptiv.io"),
        "login_emailLabel": MessageLookupByLibrary.simpleMessage("Email"),
        "login_error_400": MessageLookupByLibrary.simpleMessage(
            "Invalid email address or password"),
        "login_error_default": MessageLookupByLibrary.simpleMessage(
            "An error occurred. Please try again."),
        "login_forgotPasswordLabel":
            MessageLookupByLibrary.simpleMessage("Forgot your password?"),
        "login_googleBtnLabel":
            MessageLookupByLibrary.simpleMessage("Sign in with Google"),
        "login_passwordHint": MessageLookupByLibrary.simpleMessage("********"),
        "login_passwordLabel": MessageLookupByLibrary.simpleMessage("Password"),
        "login_subtitle": MessageLookupByLibrary.simpleMessage(
            "To continue, log in to your account."),
        "login_termsLabel": MessageLookupByLibrary.simpleMessage(
            "By logging in, you agree to our"),
        "login_termsLink":
            MessageLookupByLibrary.simpleMessage("terms of service"),
        "login_title": MessageLookupByLibrary.simpleMessage("Log In"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "or": MessageLookupByLibrary.simpleMessage("OR"),
        "pendingVerification_resendButton":
            MessageLookupByLibrary.simpleMessage("Resend"),
        "pendingVerification_subtitle": MessageLookupByLibrary.simpleMessage(
            "Please check your email and click on the link to verify your account."),
        "pendingVerification_title":
            MessageLookupByLibrary.simpleMessage("Verify your email"),
        "register_btnLabel": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "register_emailHint":
            MessageLookupByLibrary.simpleMessage("hello@adaptiv.io"),
        "register_emailLabel": MessageLookupByLibrary.simpleMessage("Email"),
        "register_forgotPasswordLabel":
            MessageLookupByLibrary.simpleMessage("Forgot your password?"),
        "register_googleBtnLabel":
            MessageLookupByLibrary.simpleMessage("Sign up with Google"),
        "register_passwordHint":
            MessageLookupByLibrary.simpleMessage("********"),
        "register_passwordLabel":
            MessageLookupByLibrary.simpleMessage("Password"),
        "register_subtitle": MessageLookupByLibrary.simpleMessage(
            "You need an account to continue."),
        "register_termsLabel": MessageLookupByLibrary.simpleMessage(
            "By signing up, you agree to our"),
        "register_termsLink":
            MessageLookupByLibrary.simpleMessage("terms of service"),
        "register_title": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "settings_apiKeyIndications":
            MessageLookupByLibrary.simpleMessage("Get your API key from "),
        "settings_groqApiKeyError": MessageLookupByLibrary.simpleMessage(
            "Please provide a groq API key in the settings."),
        "settings_groqApiKeyHint":
            MessageLookupByLibrary.simpleMessage("gsk_********************"),
        "settings_groqApiKeyLabel":
            MessageLookupByLibrary.simpleMessage("Groq API key"),
        "settings_groqApiKeyRequiredValidation":
            MessageLookupByLibrary.simpleMessage(
                "Please provide a groq API key."),
        "settings_groqApiKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Settings saved successfully."),
        "settings_logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "settings_logoutFailedBody": MessageLookupByLibrary.simpleMessage(
            "An error occurred while logging out. Please try again."),
        "settings_logoutFailedTitle":
            MessageLookupByLibrary.simpleMessage("Logout failed"),
        "settings_title": MessageLookupByLibrary.simpleMessage("Settings"),
        "successNotification_title":
            MessageLookupByLibrary.simpleMessage("Yay!"),
        "welcome_getStarted":
            MessageLookupByLibrary.simpleMessage("Get Started"),
        "welcome_signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "welcome_subtitle": MessageLookupByLibrary.simpleMessage(
            "The best free & open source ChatGPT alternative."),
        "welcome_title": MessageLookupByLibrary.simpleMessage("LineAI")
      };
}
