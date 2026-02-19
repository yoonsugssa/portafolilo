import 'package:flutter/material.dart';

class AppBarDrawerIcon extends StatefulWidget {
  const AppBarDrawerIcon({super.key});

  @override
  State<AppBarDrawerIcon> createState() => _AppBarDrawerIconState();
}

class _AppBarDrawerIconState extends State<AppBarDrawerIcon> with SingleTickerProviderStateMixin{

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
  Widget build(BuildContext context){
    return IconButton(
      onPressed: (){
        setState(() {
          if(!isOpen) controller.forward();
          else {
            controller.reverse();
          }
          isOpen = !isOpen;
        });
      },
      icon: AnimatedIcon(
      icon: AnimatedIcons.menu_close,
        progress: animation,
    ),
    );
  }
}
