import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/custom_text_field.dart';
import '../login/login_screen.dart';

class DatabaseLoginScreen extends StatelessWidget {
  DatabaseLoginScreen({super.key});

  final GlobalKey<FormState> databaseFormKey = GlobalKey<FormState>();

  final AuthController authController = Get.find<AuthController>();

  String? requiredValidator(
    String? value,
    String fieldName,
  ) {
    if (value == null || value.isEmpty) {
      return "${AppStrings.pleaseEnterMessage} $fieldName";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.databaseLoginTitle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: databaseFormKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  AppStrings.connectDatabaseTitle,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  textController: authController.urlController,
                  labelText: AppStrings.databaseUrlLabel,
                  hintText: AppStrings.databaseUrlHint,
                  validatorFunction: (value) {
                    return requiredValidator(
                      value,
                      AppStrings.databaseUrlLabel,
                    );
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(
                  textController: authController.portController,
                  labelText: AppStrings.portLabel,
                  hintText: AppStrings.portHint,
                  keyboardType: TextInputType.number,
                  validatorFunction: (value) {
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(
                  textController: authController.databaseController,
                  labelText: AppStrings.databaseNameLabel,
                  hintText: AppStrings.databaseNameHint,
                  validatorFunction: (value) {
                    return requiredValidator(
                      value,
                      AppStrings.databaseNameLabel,
                    );
                  },
                ),
                Spacer(),
                Obx(() {
                  return CustomButton(
                    onPress: () {
                      if (databaseFormKey.currentState!.validate()) {
                        Get.to(
                          () => LoginScreen(),
                        );
                      }
                    },
                    buttonText: AppStrings.continueButtonText,
                    isEnabled: authController.databaseFormValid.value,
                  );
                }),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
