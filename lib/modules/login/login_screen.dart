import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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
          key: loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                textController: authController.usernameController,
                labelText: AppStrings.usernameLabel,
                hintText: AppStrings.usernameHint,
                validatorFunction: (value) {
                  return requiredValidator(value, AppStrings.usernameLabel);
                },
              ),
              SizedBox(height: 12),
              CustomTextField(
                textController: authController.passwordController,
                labelText: AppStrings.passwordLabel,
                hintText: AppStrings.passwordHint,
                validatorFunction: (value) {
                  return requiredValidator(value, AppStrings.passwordLabel);
                },
                isPassword: true,
              ),
              SizedBox(height: 12),
              Obx(() {
                return CheckboxListTile(
                  title: Text(AppStrings.rememberMeText),
                  value: authController.rememberMeValue.value,
                  onChanged: (value) {
                    authController.toggleRememberMe(value ?? false);
                  },
                );
              }),
              SizedBox(height: 20),
              Obx(() {
                return CustomButton(
                  onPress: () {
                    if (loginFormKey.currentState!.validate()) {
                      print("Login Success");
                    }
                  },
                  buttonText: AppStrings.submitButtonText,
                  opacityValue: authController.loginFormValid.value ? 1 : 0.4,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
