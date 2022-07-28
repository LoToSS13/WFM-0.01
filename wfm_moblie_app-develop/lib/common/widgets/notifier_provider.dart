import 'package:flutter/material.dart';

class NotifierProvider<Model extends ChangeNotifier> extends InheritedNotifier {
  final Model model;
  const NotifierProvider({Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static Model? of<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>()
        ?.model;
  }
}
