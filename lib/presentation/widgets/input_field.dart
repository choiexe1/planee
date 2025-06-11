import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;

  const InputField({super.key, required this.controller, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.all(16),
        fillColor: AppColor.input,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      maxLines: maxLines,
      style: AppTextStyle.body.copyWith(color: AppColor.black),
    );
  }
}
