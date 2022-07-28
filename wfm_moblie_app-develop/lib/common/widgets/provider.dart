import 'package:flutter/material.dart';

class Provider<Model> extends InheritedWidget {
  final Model model;
  const Provider({Key? key, required this.model, required Widget child})
      : super(key: key, child: child);

  static Model? of<Model>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<Model>>()?.model;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return model != oldWidget.model;
  }
}
