import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
      appBar: AppBar(
        title: Text(
          AppStrings.loginTitle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: loginFormKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  AppStrings.welcomeBackTitle,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  textController: authController.usernameController,
                  labelText: AppStrings.usernameLabel,
                  hintText: AppStrings.usernameHint,
                  validatorFunction: (value) {
                    return requiredValidator(
                      value,
                      AppStrings.usernameLabel,
                    );
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(
                  textController: authController.passwordController,
                  labelText: AppStrings.passwordLabel,
                  hintText: AppStrings.passwordHint,
                  isPassword: true,
                  validatorFunction: (value) {
                    return requiredValidator(
                      value,
                      AppStrings.passwordLabel,
                    );
                  },
                ),
                Obx(() {
                  return CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    visualDensity: VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                    title: Text(
                      AppStrings.rememberMeText,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: authController.rememberMeValue.value,
                    onChanged: (value) {
                      authController.toggleRememberMe(
                        value ?? false,
                      );
                    },
                  );
                }),
                Spacer(),
                Obx(() {
                  return CustomButton(
                    onPress: () {
                      if (loginFormKey.currentState!.validate()) {
                        print("Login Success");
                      }
                    },
                    buttonText: AppStrings.submitButtonText,
                    isEnabled: authController.loginFormValid.value,
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
