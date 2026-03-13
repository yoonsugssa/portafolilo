import 'package:flutter/material.dart';
import 'dart:math' as math;

class PolaroidStack extends StatefulWidget {
  const PolaroidStack({super.key});

  @override
  State<PolaroidStack> createState() => _PolaroidStackState();
}

class _PolaroidStackState extends State<PolaroidStack> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: SizedBox(
        height: 400,
        width: 350,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildAnimatedImage(
              'assets/images/polaroids/imagen1.png',
              angle: isHovered ? -math.pi / 9 : 0,
              offset: isHovered ? const Offset(-100, -10) : Offset.zero,
            ),
            _buildAnimatedImage(
              'assets/images/polaroids/imagen3.png',
              angle: isHovered ? math.pi / 9 : 0,
              offset: isHovered ? const Offset(100, -10) : Offset.zero,
            ),
            _buildAnimatedImage(
              'assets/images/polaroids/imagen2.png',
              angle: 0,
              offset: isHovered ? const Offset(0, -30) : Offset.zero,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedImage(String asset, {required double angle, required Offset offset}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutBack,
      transform: Matrix4.identity()
        ..translate(offset.dx, offset.dy)
        ..rotateZ(angle),
      transformAlignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Image.asset(
          asset,
          width: 350,
          height: 400,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}