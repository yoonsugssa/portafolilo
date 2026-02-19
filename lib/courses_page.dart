import 'package:flutter/material.dart';
import 'package:portafolilo/widgets/appbar/my_app_bar.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

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

    ]
    );
  }
}

