import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portafolilo/widgets/provider.dart';
import 'package:portafolilo/widgets/seo_text.dart';

import '../constan/app_icon.dart';
import '../extensions.dart';
import '../style/app_colors.dart';

class LanguageSwitch extends ConsumerWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locale = ref.watch(appLocaleProvider);
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: PopupLanguageSwitchItem(
              language: 'Español',
              icon: AppIcon.en, // Corregido
            ),
          ),
          PopupMenuItem(
            value: 1,
            child: PopupLanguageSwitchItem(
              language: 'English',
              icon: AppIcon.es, // Corregido
            ),
          ),
        ];
      },
      initialValue: locale.value == 'es' ? 0 : 1,
      onSelected: (value) {
        if (value == 0) {
          ref.read(appLocaleProvider.notifier).changeLocale('es');
        } else {
          ref.read(appLocaleProvider.notifier).changeLocale('en');
        }
      },
      child: Row(
        children: [
          Icon(
            Icons.language,
            color: AppColors.blue,
          ),
          const Gap(4),
          Localizations.localeOf(context).languageCode == 'es'
              ? SvgPicture.asset(
                  AppIcon.en, // Corregido
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
