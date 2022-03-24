import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:squadio_task/core/consts.dart';
import 'package:squadio_task/core/services/bindings.dart';
import 'package:squadio_task/core/services/theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  Constants.tmdbWithCustomLogs;
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: Binding(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      defaultTransition: Transition.fadeIn,
    ),
  );
}
