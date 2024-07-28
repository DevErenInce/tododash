import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension LocalizationExtension on String {
  String get transalate => this.tr();
}

extension ContextLocalizationExtension on BuildContext {
  Locale get productLocale => locale;
  set productLocale(Locale locale) => setLocale(locale);
  List<Locale> get productSupportedLocales => supportedLocales;
  List<LocalizationsDelegate<dynamic>> get productLocalizationDelegates =>
      localizationDelegates;
}
