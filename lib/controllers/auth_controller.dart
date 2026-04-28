import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController urlController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController databaseController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool rememberMeValue = false.obs;
  RxBool databaseFormValid = false.obs;
  RxBool loginFormValid = false.obs;

  @override
  void onInit() {
    super.onInit();

    urlController.addListener(validateDatabaseForm);
    databaseController.addListener(validateDatabaseForm);

    usernameController.addListener(validateLoginForm);
    passwordController.addListener(validateLoginForm);
  }

  void validateDatabaseForm() {
    databaseFormValid.value =
        urlController.text.isNotEmpty && databaseController.text.isNotEmpty;
  }

  void validateLoginForm() {
    loginFormValid.value = usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  void toggleRememberMe(bool value) {
    rememberMeValue.value = value;
  }

  @override
  void onClose() {
    urlController.dispose();
    portController.dispose();
    databaseController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
