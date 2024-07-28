import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:generation/generation.dart';
import 'package:tododash/feature/test_view.dart';
import 'package:tododash/product/init/application_initialize.dart';

void main() async {
  await ApplicationInitialize().make(environment: ProdEnv());

  runApp(ProductLocalization.localizeApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return ProductLocalization.materialApp(
      context: context,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TestView(),
    );
  }
}
