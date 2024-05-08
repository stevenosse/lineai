import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lineai/gen/assets.gen.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/features/chat/ui/components/tips_card.dart';
import 'package:lineai/src/shared/components/gap.dart';

const _tipsCardHeight = 80.0;

class ChatsEmptyState extends StatelessWidget {
  const ChatsEmptyState({super.key});

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
          height: _tipsCardHeight,
          child: ListView.builder(
            itemCount: 4,
            padding: const EdgeInsets.only(left: Dimens.spacing),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TipsCard(
                title: I18n.of(context).chat_tips_title,
                subtitle: I18n.of(context).chat_tips_subtitle,
              );
            },
          ),
        ),
      ],
    );
  }
}
