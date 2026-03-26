import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portafolilo/widgets/app_locale_controller.dart';
import 'package:portafolilo/widgets/seo_text.dart';

import '../constan/app_icon.dart';
import '../extensions.dart';

class LanguageSwitch extends ConsumerWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locale = ref.watch(appLocaleControllerProvider);
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: PopupLanguageSwitchItem(
              language: 'Español',
              icon: AppIcon.es,
            ),
          ),
          PopupMenuItem(
            value: 1,
            child: PopupLanguageSwitchItem(
              language: 'English',
              icon: AppIcon.en,
            ),
          ),
        ];
      },
      initialValue: locale.value == 'es' ? 0 : 1,
      onSelected: (value) {
        if (value == 0) {
          ref.read(appLocaleControllerProvider.notifier).changeLocale('es');
        } else {
          ref.read(appLocaleControllerProvider.notifier).changeLocale('en');
        }
      },
      child: Row(
        children: [
          Icon(
            Icons.language,
            color: context.colorScheme.surface,
          ),
          const Gap(4),
          Localizations.localeOf(context).languageCode == 'es'
              ? SvgPicture.asset(
                  AppIcon.es,
                  width: 18,
                  height: 18,
                )
              : SvgPicture.asset(
                  AppIcon.en,
                  width: 18,
                  height: 18,
                )
        ],
      ),
    );
  }
}

class PopupLanguageSwitchItem extends StatelessWidget {
  const PopupLanguageSwitchItem({
    super.key,
    required this.language,
    required this.icon,
  });

  final String language;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 18,
          height: 18,
        ),
        const Gap(8),
        SEOText(language),
      ],
    );
  }
}
