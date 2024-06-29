import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';

class CustomGenralButton extends StatelessWidget {
  const CustomGenralButton({
    super.key,
    required this.onPressed,
    required this.name,
  });
  final Function() onPressed;
  final String name;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      minWidth: 200,
      textColor: AppColors.secondary,
      color: AppColors.primary,
      onPressed: onPressed,
      child: Text(
        name,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
