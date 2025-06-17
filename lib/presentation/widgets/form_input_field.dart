import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';

class FormInputField extends StatelessWidget {
  const FormInputField({
    required this.validator,
    required this.controller,
    super.key,
    this.maxLines = 1,
    this.hintText,
    this.maxLength,
  });

  final TextEditingController controller;
  final String? Function(String? value) validator;
  final int maxLines;
  final String? hintText;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.body.copyWith(color: AppColor.grey),
        filled: true,
        contentPadding: const EdgeInsets.all(16),
        fillColor: AppColor.input,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.red),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.red),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        errorStyle: AppTextStyle.body.copyWith(color: AppColor.red),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      style: AppTextStyle.body.copyWith(color: AppColor.black),
      validator: validator,
    );
  }
}
