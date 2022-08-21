import 'package:flutter/material.dart';
import 'package:shop_app/utilities/constants/color_manager.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double width, height;
  final Color buttonColor, borderColor, textColor;

  const Button({
    Key? key,
    required this.title,
    required this.onPress,
    this.width = double.infinity,
    this.height = 50,
    this.buttonColor = ColorManager.kSecondaryColor,
    this.borderColor = ColorManager.kSecondaryColor,
    this.textColor = ColorManager.kWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(color: borderColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
