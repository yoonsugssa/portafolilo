import 'package:flutter/cupertino.dart';
import 'package:portafolilo/routes/app_route.dart';

import '../extensions.dart';

class AppMenuList {
  static List<AppMenu> getItems(BuildContext context){
    return[
      AppMenu(title: context.texts.home, path: Routes.home),
      AppMenu(title: context.texts.courses, path: Routes.courses),
      AppMenu(title: context.texts.aboutMe, path: Routes.about),
      AppMenu(title: context.texts.blog, path: Routes.blog),
    ];
  }
}

class AppMenu{
  final String title;
  final String path;

  AppMenu({required this.title, required this.path});
}
