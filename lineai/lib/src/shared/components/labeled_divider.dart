// Drawing a divider with some text in the center
import 'package:flutter/material.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

class LabeledDivider extends StatelessWidget {
  final String label;
  final EdgeInsetsGeometry labelPadding;

  const LabeledDivider({
    required this.label,
    this.labelPadding = const EdgeInsets.symmetric(horizontal: Dimens.spacing),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Divider(),
        Container(
          padding: labelPadding,
          color: context.colorScheme.background,
          child: Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurface.withOpacity(.8)),
          ),
        )
      ],
    );
  }
}
