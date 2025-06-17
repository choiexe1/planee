import 'package:flutter/material.dart';
import 'package:planee/presentation/widgets/form_input_field.dart';

class LabeledFormInputField extends StatelessWidget {
  const LabeledFormInputField({
    required this.label,
    required this.validator,
    required this.controller,
    super.key,
    this.maxLines = 1,
    this.editable = false,
    this.hintText,
    this.maxLength,
  });

  final Text label;
  final TextEditingController controller;
  final String? Function(String? value) validator;
  final int maxLines;
  final int? maxLength;
  final bool editable;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Row(children: [label, if (editable) const Icon(Icons.edit_sharp)]),
        FormInputField(
          controller: controller,
          maxLines: maxLines,
          maxLength: maxLength,
          validator: validator,
          hintText: hintText,
        ),
      ],
    );
  }
}
