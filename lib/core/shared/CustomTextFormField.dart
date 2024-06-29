import 'package:flutter/material.dart';
import 'package:note_app/core/constant/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.isTitle = true,
    required this.name,
    super.key,
    required this.controller,
  });

  final TextEditingController controller;
  final String name;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // ignore: body_might_complete_normally_nullable
      validator: (value) {
        if (value!.isEmpty) {
          return 'لايمكن ان يكون هذا الحقل فارغ ';
        }
        
      },
      maxLines: isTitle ? 1 : 5,
      controller: controller,
      decoration: InputDecoration(
        hintText: name,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: AppColors.primary)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: AppColors.inversePrimary)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: AppColors.erorr)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: AppColors.erorr)),
      ),
    );
  }
}
