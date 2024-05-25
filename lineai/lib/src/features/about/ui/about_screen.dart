import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/gen/assets.gen.dart';
import 'package:lineai/src/core/environment.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/components/main_app_bar.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
import 'package:lineai/src/shared/extensions/iterable_extensions.dart';
import 'package:lineai/src/shared/utils/url_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

@RoutePage()
class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  PackageInfo? packageInfo;

  @override
  void initState() {
    super.initState();
    _getPackageInfo();
  }

  void _getPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: I18n.of(context).about_title),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(IconsaxPlusBroken.document_text),
            title: Text(I18n.of(context).about_termsOfUse),
            onTap: () => openUrl(Environment.privacyPolicyUrl),
          ),
          ListTile(
            leading: const Icon(IconsaxPlusBroken.document_text_1),
            title: Text(I18n.of(context).about_privacyPolicy),
            onTap: () => openUrl(Environment.termsOfServiceUrl),
          ),
          ListTile(
            leading: const Icon(IconsaxPlusBroken.document),
            title: Text(I18n.of(context).about_licenses),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute<void>(
                builder: (BuildContext context) => LicensePage(
                  applicationName: 'LineAI',
                  applicationVersion: packageInfo?.version,
                  applicationIcon: SvgPicture.asset(
                    Assets.images.lineaiFlatLogo,
                    width: kMinInteractiveDimension,
                    height: kMinInteractiveDimension,
                  ),
                  applicationLegalese: 'LineAI™',
                ),
              ));
            },
          ),
          Text(
            I18n.of(context).about_legalNotice,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.w500, color: context.colorScheme.onSurface),
          ),
          const Gap.vertical(height: Dimens.halfSpacing),
          if (packageInfo != null)
            ...[
              Text(
                'Version: ${packageInfo!.version}',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(fontWeight: FontWeight.w400, color: context.colorScheme.onSurface),
              ),
              Text(
                'Build: ${packageInfo!.buildNumber}',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(fontWeight: FontWeight.w400, color: context.colorScheme.onSurface),
              ),
            ].divide(separator: const Gap.vertical(height: Dimens.halfSpacing))
        ],
      ),
    );
  }
}
