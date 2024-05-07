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

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
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
