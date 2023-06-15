import 'package:flutter/material.dart';

class StylesPalette {
  const StylesPalette({
    required this.medium32,
    required this.medium20,
    required this.medium14,
    required this.regular16,
    required this.regular14,
  });

  final TextStyle medium32;
  final TextStyle medium20;
  final TextStyle medium14;
  final TextStyle regular16;
  final TextStyle regular14;
}

class Roboto {
  const Roboto._();

  static const fontFamily = 'Roboto';

  static const medium32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
    height: 38 / 32,
  );

  static const medium20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
    height: 32 / 20,
  );

  static const medium14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
    height: 24 / 14,
  );

  static const regular16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    height: 20 / 16,
  );

  static const regular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    height: 20 / 14,
  );
}
