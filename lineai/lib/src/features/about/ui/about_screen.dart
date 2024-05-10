import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/shared/components/main_app_bar.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

@RoutePage()
class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: I18n.of(context).about_title),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(IconsaxPlusBroken.document_text),
            title: Text(I18n.of(context).about_termsOfUse),
            onTap: () {
              // TODO: Add terms of use
            },
          ),
          ListTile(
            leading: const Icon(IconsaxPlusBroken.document_text_1),
            title: Text(I18n.of(context).about_privacyPolicy),
            onTap: () {
              // TODO: Add privacy policy
            },
          ),
          ListTile(
            leading: const Icon(IconsaxPlusBroken.document),
            title: Text(I18n.of(context).about_licenses),
            onTap: () {
              // TODO: Add licenses
            },
          ),
          Text(
            I18n.of(context).about_legalNotice,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.w400, color: context.colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
