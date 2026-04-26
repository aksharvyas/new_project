import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;

  final String buttonText;

  final double opacityValue;

  CustomButton({
    required this.onPress,
    required this.buttonText,
    required this.opacityValue,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacityValue,
      child: ElevatedButton(
        onPressed: opacityValue == 1 ? onPress : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          minimumSize: Size(double.infinity, 50),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
