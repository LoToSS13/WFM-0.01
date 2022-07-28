import 'package:flutter/material.dart';
import 'package:wfm_mobile_app/common/styles/colors.dart';
import 'package:wfm_mobile_app/features/auth/widgets/footter_widget.dart';

import '../widgets/form/form_widget.dart';
import '../widgets/header_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: const [
            HeaderWidget(),
            FormWidget(),
            FootterWidget(),
          ],
        ),
      ),
    );
  }
}
