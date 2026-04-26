import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/custom_text_field.dart';
import '../login/login_screen.dart';

class DatabaseLoginScreen extends StatelessWidget {
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: databaseFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                textController: authController.urlController,
                labelText: AppStrings.databaseUrlLabel,
                hintText: AppStrings.databaseUrlHint,
                validatorFunction: (value) {
                  return requiredValidator(value, AppStrings.databaseUrlLabel);
                },
              ),
              SizedBox(height: 12),
              CustomTextField(
                textController: authController.portController,
                labelText: AppStrings.portLabel,
                hintText: AppStrings.portHint,
                validatorFunction: (value) {
                  return null;
                },
              ),
              SizedBox(height: 12),
              CustomTextField(
                textController: authController.databaseController,
                labelText: AppStrings.databaseNameLabel,
                hintText: AppStrings.databaseNameHint,
                validatorFunction: (value) {
                  return requiredValidator(value, AppStrings.databaseNameLabel);
                },
              ),
              SizedBox(height: 20),
              Obx(() {
                return CustomButton(
                  onPress: () {
                    if (databaseFormKey.currentState!.validate()) {
                      Get.to(() => LoginScreen());
                    }
                  },
                  buttonText: AppStrings.continueButtonText,
                  opacityValue:
                      authController.databaseFormValid.value ? 1 : 0.4,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
