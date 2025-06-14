import 'package:flutter/material.dart';
import 'package:planee/presentation/widgets/input_field.dart';

class FormInputField extends StatelessWidget {
  const FormInputField({
    required this.label,
    required this.controller,
    super.key,
  });

  final Text label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        label,
        InputField(controller: controller),
      ],
    );
  }
}
