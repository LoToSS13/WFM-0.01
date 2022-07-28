import 'package:flutter/material.dart';
import 'package:wfm_mobile_app/common/styles/app_theme.dart';
import 'package:wfm_mobile_app/features/app/my_app_model.dart';

import '../navigation/main_navigation.dart';

//custom app to add model
class MyApp extends StatelessWidget {
  final MyAppModel model;

  static final mainNavigation = MainNavigation();
  const MyApp({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WFM',
      theme: appTheme,
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(model.isAuth),
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
