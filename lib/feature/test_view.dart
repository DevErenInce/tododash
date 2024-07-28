import 'dart:developer';

import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:generation/generation.dart';
import 'package:model/model.dart';
import 'package:tododash/product/state/container/product_state_items.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  TextEditingController sessionIdController = TextEditingController();
  String sessionId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test View'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(AppEnvironment.env.environment),
          const SizedBox(height: 20),
          Text(LocaleKeys.home_title.transalate),
          ElevatedButton(
            onPressed: () {
              ProductLocalization.updateLanguage(
                context: context,
                value: context.productLocale == Locales.tr.locale
                    ? Locales.en
                    : Locales.tr,
              );
            },
            child: Text(
              LocaleKeys.general_button_language_change.transalate,
            ),
          ),
          //Read Init Data
          ElevatedButton(
            onPressed: () async {
              final networkManager = ProductStateItems.networkManager;

              final initConfigurationTransaction =
                  GetInitialConfigurationTransaction();
              final response = await networkManager
                  .execute<GetInitialConfigurationTransaction>(
                initConfigurationTransaction,
              );
              print(response.response.configurations?[0].value);
            },
            child: const Text('Read Init Data'),
          ),
          //Register
          ElevatedButton(
            onPressed: () async {
              final networkManager = ProductStateItems.networkManager;
              const registerRequestModel = RegisterRequestModel(
                name: 'Test',
                surname: 'Test1',
                email: 'test@gmail.com',
                password: '12345678',
              );
              final registerTransaction = RegisterTransaction(
                request: registerRequestModel,
              );
              final response =
                  await networkManager.execute<RegisterTransaction>(
                registerTransaction,
              );
              print(response.isSuccess);
              print(response.error);
              print(response.response.user);
            },
            child: const Text('Register'),
          ),
          //Login
          ElevatedButton(
            onPressed: () async {
              final networkManager = ProductStateItems.networkManager;
              const loginRequestModel = LoginRequestModel(
                email: 'test@gmail.com',
                password: '12345678',
              );

              final loginTransaction = LoginTransaction(
                request: loginRequestModel,
              );
              final response = await networkManager.execute<LoginTransaction>(
                loginTransaction,
              );
              print(response.isSuccess);
              print(response.error);
              print(response.response.session);

              sessionId = response.response.session?.id ?? '';
              print('Session ID: $sessionId');
            },
            child: const Text('Login'),
          ),
          //Logout
          TextField(
            controller: sessionIdController,
            onChanged: (value) {
              sessionId = value;
            },
            decoration: const InputDecoration(
              hintText: 'Session ID',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final networkManager = ProductStateItems.networkManager;

              final logoutRequestModel = LogoutRequestModel(
                sessionId: sessionIdController.text.trim(),
              );

              final logoutTransaction = LogoutTransaction(
                request: logoutRequestModel,
              );
              final response = await networkManager.execute<LogoutTransaction>(
                logoutTransaction,
              );
              print(response.isSuccess);
              print(response.error);
              print(response.response.success);
            },
            child: const Text('Logout'),
          ),
          ElevatedButton(
            onPressed: () async {
              final cacheManager = ProductStateItems.cacheManager;
              const cacheTestModel = CacheTestModel(
                name: 'Eren',
                surname: 'Ince',
                age: 25,
                isAdult: true,
              );
              final result = await cacheManager.create<CacheTestModel>(
                cacheTestModel,
              );
              inspect(result.name);
            },
            child: const Text('Save Cache'),
          ),
          ElevatedButton(
            onPressed: () async {
              final cacheManager = ProductStateItems.cacheManager;
              final result = await cacheManager.getAll<CacheTestModel>();
              inspect(result.first);
            },
            child: const Text('Read Cache'),
          ),
          ElevatedButton(
            onPressed: () async {
              FirebaseCrashlyticsManager.instance.testCrash();
            },
            child: const Text('Test Crash'),
          ),
        ],
      ),
    );
  }
}
