import 'package:flutter/material.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

final class DialogBuilder {
  static Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required String message,
    bool isDestructiveAction = false,
  }) async {
    return await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: context.colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.borderRadius)),
          title: Text(
            I18n.of(context).confirmDialog_title,
            style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                I18n.of(context).cancel,
                style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurface),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                I18n.of(context).confirm,
                style: context.textTheme.bodySmall
                    ?.copyWith(color: isDestructiveAction ? context.colorScheme.error : context.colorScheme.primary),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showAlertDialog({required BuildContext context, required String message}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          surfaceTintColor: Colors.transparent,
          backgroundColor: context.colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.borderRadius)),
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
          backgroundColor: context.colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.borderRadius)),
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
