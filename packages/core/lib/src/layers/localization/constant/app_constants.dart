import 'package:core/src/layers/localization/constant/enum/locales.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const String translationPath = 'assets/translations';

  static final List<Locale> localeSupportedItems = [
    Locales.tr.locale,
    Locales.en.locale,
  ];
}
