import 'package:flutter/material.dart';

import '../../../../common/styles/fields_buttom_const.dart';
import '../../../navigation/main_navigation.dart';
import '../../models/auth_model.dart';

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AuthModel? model;

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final child = model?.isAuthProgress == true
        ? const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ))
        : const Text('Login');
    return ElevatedButton(
      style: loginButtonStyle,
      onPressed: () async {
        if (model?.canStartAuth == true) {
          await model?.auth();
        }
        if (model?.isAuth == true) {
          navigator.pushReplacementNamed(MainNavigationRouteName.calendar);
        }
      },
      child: child,
    );
  }
}
