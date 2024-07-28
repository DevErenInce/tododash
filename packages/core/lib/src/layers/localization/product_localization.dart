import 'package:core/src/layers/localization/constant/app_constants.dart';
import 'package:core/src/layers/localization/constant/enum/locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';

@immutable
class ProductLocalization {
  static Future<void> init() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
  }

  static Widget localizeApp(Widget app) {
    return EasyLocalization(
      supportedLocales: AppConstants.localeSupportedItems,
      path: AppConstants.translationPath,
      useOnlyLangCode: true,
      child: app,
    );
  }

  static Widget materialApp({
    required BuildContext context,
    required String title,
    required bool debugShowCheckedModeBanner,
    required ThemeData theme,
    required Widget home,
  }) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      theme: theme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: home,
    );
  }

  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}
