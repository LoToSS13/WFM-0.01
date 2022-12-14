import 'package:flutter/material.dart';
import 'package:wfm_mobile_app/features/app/my_app.dart';
import 'package:wfm_mobile_app/features/app/my_app_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.chechAuth();
  final app = MyApp(model: model);
  runApp(app);
}
