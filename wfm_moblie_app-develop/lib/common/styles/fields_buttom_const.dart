import 'package:flutter/material.dart';
import 'colors.dart';

//
//Default app radius
//
const BorderRadius radius = BorderRadius.all(Radius.circular(8.0));
//
//Login button style
//
ButtonStyle loginButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(primaryColor),
  foregroundColor: MaterialStateProperty.all(Colors.white),
  textStyle: MaterialStateProperty.all(
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
  ),
  padding: MaterialStateProperty.all(
    const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 8,
    ),
  ),
);
