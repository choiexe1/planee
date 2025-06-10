library;

import 'package:flutter/widgets.dart';

abstract class AppTextStyle {
  static const String font = 'Plus Jakarta Sans';

  static const TextStyle subTitle1 = TextStyle(
    fontFamily: font,
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.02,
  );

  static const TextStyle subTitle2 = TextStyle(
    fontFamily: font,
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.02,
  );

  static const TextStyle body = TextStyle(
    fontFamily: font,
    fontSize: 14,
    height: 1.5,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.18,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: font,
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.18,
  );

  static const TextStyle date = TextStyle(
    fontFamily: font,
    fontSize: 13,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );
}
