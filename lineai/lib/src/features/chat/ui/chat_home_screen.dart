import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/gen/assets.gen.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/features/chat/ui/components/tips_card.dart';
import 'package:lineai/src/shared/components/forms/input.dart';

import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

const _tipsCardHeight = 80.0;

@RoutePage()
class ChatHomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => this;
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
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
            Padding(
              padding: const EdgeInsets.all(Dimens.spacing),
              child: Row(
                children: [
                  Expanded(
                    child: Input(
                      controller: _messageController,
                      fillColor: context.colorScheme.surface,
                      filled: true,
                      isBorderless: true,
                      hintText: I18n.of(context).chat_inputPlaceholder,
                      textInputAction: TextInputAction.newline,
                    ),
                  ),
                  const Gap.horizontal(width: Dimens.halfSpacing),
                  IconButton.filled(
                    onPressed: () {},
                    icon: const Icon(IconsaxPlusBroken.arrow_up, size: Dimens.iconSizeS),
                    style: IconButton.styleFrom(
                      padding: const EdgeInsets.all(12.0),
                      backgroundColor: context.colorScheme.onBackground,
                      foregroundColor: context.colorScheme.background,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
