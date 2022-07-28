import 'package:flutter/material.dart';
import 'package:wfm_mobile_app/common/widgets/notifier_provider.dart';
import 'package:wfm_mobile_app/features/auth/models/auth_model.dart';

import '../../common/constants/texts.dart';
import '../auth/screens/auth_screen.dart';
import '../calendar/screens/calendar_screen.dart';

class MainNavigationRouteName {
  static const auth = 'auth';
  static const calendar = 'calendar';
  static const profile = 'profile';

  const MainNavigationRouteName._();
}

class MainNavigation {
  String initialRoute(bool isAuth) =>
      isAuth ? MainNavigationRouteName.calendar : MainNavigationRouteName.auth;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteName.auth: (context) => NotifierProvider(
          model: AuthModel(),
          child: const AuthScreen(),
        ),
    MainNavigationRouteName.calendar: (context) => CalendarScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          body: Center(child: goose),
        );
      },
    );
  }
}
