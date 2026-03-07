import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portafolilo/style/app_colors.dart';
import 'package:portafolilo/widgets/appbar/drawer_menu.dart';

class AppBarDrawerIcon extends ConsumerStatefulWidget {
  const AppBarDrawerIcon({super.key});

  @override
  ConsumerState<AppBarDrawerIcon> createState() => _AppBarDrawerIconState();
}

class _AppBarDrawerIconState extends ConsumerState<AppBarDrawerIcon> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double>animation;

  bool isOpen = false;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    animation = Tween<double>(begin: 0.0,end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: (){
        setState(() {
          if (!isOpen){
            controller.forward();
          ref.read(drawerMenuControllerProvider.notifier).open();
        } else {
            controller.reverse();
            ref.read(drawerMenuControllerProvider.notifier).close();
          }
          isOpen = !isOpen;

        });
      },
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: animation,
            color: AppColors.blue,
            size: 24,
          ),
        ),
      ),
    );
  }
}
