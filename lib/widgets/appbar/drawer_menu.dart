import 'package:flutter/material.dart';
import 'package:portafolilo/extensions.dart';

import 'my_app_bar.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu>
    with SingleTickerProviderStateMixin{
  late final _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );

  late final _animation = Tween<Offset>(
  begin: const Offset(0, -1),
  end: Offset.zero,
).animate(
  CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn
  ),
  );

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          boxShadow :[
          BoxShadow(
              color: context.colorScheme.surface.withOpacity(0.9),
              blurRadius: 6,
              spreadRadius: 2,
          ),
          ]
          ),
          child: const SmallMenu(),
      ),
    );
  }
}
