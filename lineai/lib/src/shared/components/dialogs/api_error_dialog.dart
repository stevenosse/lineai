import 'package:flutter/material.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/datasource/models/api_error.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiErrorDialog {
  static bool isRecoverableError(ApiError error) {
    // The error is recoverable if it's a network error or a server error
    return error.type == ApiErrorType.network || error.type == ApiErrorType.server;
  }

  static void show({
    required BuildContext context,
    required ApiError error,
    VoidCallback? retry,
  }) {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) {
        return AlertDialog(
          surfaceTintColor: Colors.transparent,
          title: Text(
            I18n.of(context).errorDialog_title,
            style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          content: Text(error.describe(context: context)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(I18n.of(context).ok),
            ),
            if (isRecoverableError(error) && retry != null)
              TextButton(
                onPressed: retry,
                child: Text(I18n.of(context).retry),
              )
          ],
        );
      },
    );
  }
}

extension ApiErrorX on ApiError {
  String describe({required BuildContext context}) {
    return switch (type) {
      ApiErrorType.network => I18n.of(context).error_noInternet,
      ApiErrorType.server => I18n.of(context).error_server,
      ApiErrorType.user => _extractResponseMessage() ?? I18n.of(context).error_unknown,
      ApiErrorType.unknown => I18n.of(context).error_unknown,
    };
  }

  String? _extractResponseMessage() {
    if (error is AuthException) {
      final authException = error as AuthException;

      return authException.message;
    } else if (error is FunctionException) {
      final functionException = error as FunctionException;

      return functionException.details?.message;
    }
    return null;
  }
}
