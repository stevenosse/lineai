import 'package:flutter/material.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

enum ButtonType {
  primary,
  outline,
}

class Button extends StatelessWidget {
  const Button._({
    super.key,
    required this.title,
    this.onPressed,
    required this.type,
    this.icon,
  });

  factory Button.primary({
    Key? key,
    required String title,
    Widget? icon,
    VoidCallback? onPressed,
  }) {
    return Button._(
      key: key,
      title: title,
      icon: icon,
      onPressed: onPressed,
      type: ButtonType.primary,
    );
  }

  factory Button.outline({
    Key? key,
    required String title,
    Widget? icon,
    VoidCallback? onPressed,
  }) {
    return Button._(
      key: key,
      title: title,
      icon: icon,
      onPressed: onPressed,
      type: ButtonType.outline,
    );
  }

  final String title;
  final Widget? icon;
  final VoidCallback? onPressed;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    final label = Text(
      title,
      style: context.textTheme.bodyMedium?.copyWith(
        color: type == ButtonType.primary ? context.colorScheme.background : context.colorScheme.onBackground,
        fontWeight: FontWeight.w500,
      ),
    );
    return SizedBox(
      width: double.infinity,
      height: kMinInteractiveDimension,
      child: switch (type) {
        ButtonType.primary => ElevatedButton.icon(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.borderRadius)),
              backgroundColor: context.colorScheme.onBackground,
            ),
            icon: icon ?? const SizedBox(),
            label: label,
          ),
        ButtonType.outline => OutlinedButton.icon(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.borderRadius)),
              side: BorderSide(color: context.colorScheme.onBackground.withOpacity(.3), width: 1.2),
            ),
            icon: icon ?? const SizedBox(),
            label: label,
          )
      },
    );
  }
}