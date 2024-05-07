import 'package:flutter/material.dart';
import 'package:lineai/src/core/i18n/l10n.dart';

final class DialogBuilder {
  static Future<void> showAlertDialog({required BuildContext context, required String message}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          surfaceTintColor: Colors.transparent,
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(I18n.of(context).ok),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showErrorDialog({required BuildContext context, required String message}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          surfaceTintColor: Colors.transparent,
          title: Text(I18n.of(context).errorDialog_title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(I18n.of(context).ok),
            ),
          ],
        );
      },
    );
  }
}
