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

  void validateDatabaseForm() {
    if (urlController.text.isNotEmpty && databaseController.text.isNotEmpty) {
      databaseFormValid.value = true;
    } else {
      databaseFormValid.value = false;
    }
  }

  void validateLoginForm() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      loginFormValid.value = true;
    } else {
      loginFormValid.value = false;
    }
  }

  void toggleRememberMe(bool value) {
    rememberMeValue.value = value;
  }
}
