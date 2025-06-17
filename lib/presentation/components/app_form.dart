import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';
import 'package:planee/presentation/widgets/tap_button.dart';

class AppForm extends StatefulWidget {
  const AppForm({
    required this.onSubmitted,
    required this.fields,
    super.key,
    this.spacing,
  });

  final List<Widget> fields;
  final VoidCallback onSubmitted;
  final double? spacing;

  @override
  AppFormState createState() {
    return AppFormState();
  }
}

class AppFormState extends State<AppForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: widget.spacing ?? 0.0,
        children: [
          ...widget.fields,
          TapButton(
            name: Text(
              '저장',
              style: AppTextStyle.subTitle2.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColor.white,
              ),
            ),
            onTap: () {
              final validated = _formKey.currentState!.validate();

              if (validated) {
                widget.onSubmitted();
              }
            },
          ),
        ],
      ),
    );
  }
}
