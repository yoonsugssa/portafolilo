import 'package:flutter/material.dart';
import 'package:portafolilo/style/app_colors.dart';
import 'package:portafolilo/widgets/appbar/my_app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        body: SingleChildScrollView(
          child: content(context),
        ));
  }

  Widget content(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
          "Sobre mí",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 25, color: AppColors.darkgreen, fontFamily: 'texto'),
        ),
      ),
      ]
    );
  }

}
