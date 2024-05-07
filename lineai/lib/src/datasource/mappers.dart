import 'package:flutter/material.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension AuthExceptionMapper on AuthException {
  String describe({required BuildContext context}) {
    return switch (statusCode) {
      '400' => I18n.of(context).login_error_400,
      _ => I18n.of(context).login_error_default,
    };
  }
}
