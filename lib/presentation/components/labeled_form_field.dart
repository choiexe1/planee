import 'package:flutter/material.dart';
import 'package:planee/presentation/widgets/form_input_field.dart';

class LabeledFormInputField extends StatelessWidget {
  const LabeledFormInputField({
    required this.label,
    required this.validator,
    super.key,
  });

  final Text label;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        label,
        FormInputField(validator: validator),
      ],
    );
  }
}
