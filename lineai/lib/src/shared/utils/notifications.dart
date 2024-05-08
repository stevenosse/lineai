import 'package:flutter/material.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:toastification/toastification.dart';

final $notificationService = _NotificationService();

class _NotificationService {
  void show({
    required String title,
    required String body,
    ToastificationType type = ToastificationType.success,
  }) {
    toastification.show(
      title: Text(title),
      description: Text(body),
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
      title: title ?? I18n.of(context).errorNotification_title,
      body: body,
      type: ToastificationType.error,
    );
  }
}
