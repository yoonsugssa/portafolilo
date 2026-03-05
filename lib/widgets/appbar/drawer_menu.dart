import 'package:flutter/material.dart';
import 'package:portafolilo/extensions.dart';

import 'my_app_bar.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
