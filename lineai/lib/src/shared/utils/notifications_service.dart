import 'package:flutter/material.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
import 'package:toastification/toastification.dart';

final $notificationService = _NotificationService();

class _NotificationService {
  void show({
    required BuildContext context,
    required String title,
    required String body,
    ToastificationType type = ToastificationType.success,
  }) {
    toastification.show(
      context: context,
      title: Text(
        title,
        style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
      description: Text(
        body,
        style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurface),
      ),
      type: type,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

  void showErrorNotification({
    required BuildContext context,
    String? title,
    required String body,
  }) {
    show(
      context: context,
      title: title ?? I18n.of(context).errorNotification_title,
      body: body,
      type: ToastificationType.error,
    );
  }

  void showSuccessNotification({
    required BuildContext context,
    String? title,
    required String body,
  }) {
    show(
      context: context,
      title: title ?? I18n.of(context).successNotification_title,
      body: body,
      type: ToastificationType.success,
    );
  }
}
