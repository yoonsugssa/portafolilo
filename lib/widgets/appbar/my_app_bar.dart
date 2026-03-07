import 'package:flutter/material.dart';
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
    
    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (!context.isDesktop)
          Positioned(
            top: appBarHeight,
            left: 0,
            right: 0,
            child: const DrawerMenu(),
          ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          color: AppColors.plane,
          height: appBarHeight,
          padding: EdgeInsets.symmetric(horizontal: context.isDesktop ? context.insets.padding : 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Insets.maxWidth,
            ),
            child: Row(
              children: [
                const AppLogo(),
                const Spacer(),
                if (context.isDesktop) const LargeMenu(),
                if (context.isDesktop) const Spacer(),
                const LanguageSwitch(),
                const ThemeToggle(),
                if(!context.isDesktop) const AppBarDrawerIcon(),
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
      children: AppMenuList.getItems(context)
          .map((AppMenu e) => LargeAppBarMenuItem(
          text: e.title,
          isSelected: true,
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, e.path);
          },
          )
      )
          .toList(),
    );
  }
}

class SmallMenu extends StatelessWidget {
  const SmallMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: AppMenuList.getItems(context)
          .map((AppMenu e) => LargeAppBarMenuItem(
        text: e.title,
        isSelected: true,
        onTap: (){
          Navigator.pop(context);
          Navigator.pushNamed(context, e.path);
        },
      )
      )
          .toList(),
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
          vertical: Insets.xs,
        ),
        child: Text(
          text,
          //colores de la letra del menu
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
