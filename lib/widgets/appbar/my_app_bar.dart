import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portafolilo/app_text_styles.dart';
import 'package:portafolilo/constan/app_menu_list.dart';
import 'package:portafolilo/extensions.dart';
import 'package:portafolilo/style/app_colors.dart';
import 'package:portafolilo/widgets/language_switch.dart';

import '../../style/app_size.dart';
import 'app_bar_drawer_icon.dart';
import 'drawer_menu.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarHeight = context.insets.appBarHeight;
    final isDesktop = context.isDesktop;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: appBarHeight,
          left: 0,
          right: 0,
          child: Visibility(
            visible: !isDesktop,
            maintainState: true,
            child: const DrawerMenu(),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.plane,
            border: Border(
              bottom: BorderSide(
                color: AppColors.blue.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          height: appBarHeight,
          padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? context.insets.padding : 16
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Insets.maxWidth,
            ),
            child: Row(
              children: [
                const AppLogo(),
                const Spacer(),
                if (isDesktop) ...[
                  const LargeMenu(),
                  const Spacer(),
                ],
                const LanguageSwitch(),
                const ThemeToggle(),
                if (!isDesktop) const AppBarDrawerIcon(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Portafolio',
      style: context.textStyle.titleLgBold.copyWith(
        fontFamily: 'titulo',
        color: AppColors.blue,
      ),
    );
  }
}

class LargeMenu extends StatelessWidget {
  const LargeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: AppMenuList.getItems(context)
          .map((AppMenu e) => LargeAppBarMenuItem(
        text: e.title,
        isSelected: true,
        onTap: (){
          Navigator.pushNamed(context, e.path);
        },
      )
      )
          .toList(),
    );
  }
}

class SmallMenu extends ConsumerWidget {
  const SmallMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = AppMenuList.getItems(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: items.asMap().entries.map((entry) {
        final idx = entry.key;
        final item = entry.value;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: LargeAppBarMenuItem(
                text: item.title,
                isSelected: true,
                onTap: () {
                  ref.read(drawerMenuControllerProvider.notifier).close();
                  // Usamos microtask para diferir la navegación y evitar conflictos de mouse_tracker
                  Future.microtask(() {
                    if (context.mounted) {
                      Navigator.pushNamed(context, item.path);
                    }
                  });
                },
              ),
            ),
            if (idx < items.length - 1)
              Divider(
                color: AppColors.blue.withOpacity(0.1),
                height: 1,
                thickness: 1,
                indent: 16,
                endIndent: 16,
              ),
          ],
        );
      }).toList(),
    );
  }
}

class LargeAppBarMenuItem extends StatelessWidget {
  const LargeAppBarMenuItem({super.key, required this.text, required this.isSelected, required this.onTap});

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.med,
          vertical: Insets.med,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: SmallTextStyles().bodyLgMedium.copyWith(
            color: isSelected ? AppColors.blue: AppColors.darkgreen.withOpacity(0.6),
            fontFamily: 'texto',
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(value: false, onChanged: (value){});
  }
}
