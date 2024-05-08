import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lineai/gen/assets.gen.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/datasource/constants.dart';
import 'package:lineai/src/features/chat/ui/components/tips_card.dart';
import 'package:lineai/src/shared/components/gap.dart';

const _tipsCardHeight = 90.0;

class ChatsEmptyState extends StatelessWidget {
  const ChatsEmptyState({
    super.key,
    this.onTipsTapped,
  });

  final ValueChanged<String>? onTipsTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Center(
            child: SvgPicture.asset(
              Assets.images.lineaiFlatLogo,
              width: 40,
            ),
          ),
        ),
        const Gap.vertical(height: Dimens.spacing),
        SizedBox(
          height: MediaQuery.textScalerOf(context).scale(_tipsCardHeight),
          child: ListView.builder(
            itemCount: chatTips.length,
            padding: const EdgeInsets.only(left: Dimens.spacing),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final tips = chatTips[index];
              return TipsCard(
                title: tips['title'] as String,
                subtitle: tips['subtitle'] as String,
                onTap: onTipsTapped,
              );
            },
          ),
        ),
      ],
    );
  }
}
