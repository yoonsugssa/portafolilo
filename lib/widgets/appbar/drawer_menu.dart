import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portafolilo/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:portafolilo/style/app_colors.dart';
import 'my_app_bar.dart';
part 'drawer_menu.g.dart';



class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({super.key});

  @override
  ConsumerState<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu>
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
    ref.listen(drawerMenuControllerProvider,
          (previous, next){
      if(next.value==true){
        _controller.forward();
      }else{
        _controller.reverse();
      }
          },
    );
    return ClipRRect(
      child: SlideTransition(
      position: _animation,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.plane,
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
    ),
    );
  }
}

@riverpod
class DrawerMenuController extends _$DrawerMenuController {
  @override
  FutureOr<bool> build() {
    return false;
  }
  open(){
    update((state) => true);
  }

  close(){
    update((state) => false);
  }
}