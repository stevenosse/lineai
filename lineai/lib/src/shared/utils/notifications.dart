import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

final $notificationService = _NotificationService();

class _NotificationService {
  Future<void> show({
    required String title,
    required String body,
    ToastificationType type = ToastificationType.success,
  }) async {
    toastification.show(
      title: Text(title),
      description: Text(body),
      type: type,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }
}
