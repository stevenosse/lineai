import 'package:flutter/material.dart';
import 'package:lineai/src/core/theme/dimens.dart';

class TipsCard extends StatelessWidget {
  const TipsCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: InkWell(
        onTap: () => onTap?.call('$title $subtitle'),
        borderRadius: BorderRadius.circular(Dimens.borderRadius),
        child: Padding(
          padding: const EdgeInsets.only(right: Dimens.halfSpacing),
          child: Card(
            surfaceTintColor: Colors.transparent,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.borderRadius)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
