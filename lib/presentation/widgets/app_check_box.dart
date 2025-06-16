import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';

class AppCheckbox extends StatefulWidget {
  const AppCheckbox({super.key, this.checked = false});

  final bool checked;

  @override
  State<StatefulWidget> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  bool _checked = false;

  void toggleChecked() {
    setState(() {
      _checked = !_checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleChecked,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: _checked ? null : Border.all(color: const Color(0xFF8C8C8C)),
          borderRadius: BorderRadius.circular(8),
          color: _checked ? AppColor.blue : Colors.transparent,
        ),
        child: _checked
            ? const Icon(Icons.check, size: 24, color: AppColor.white)
            : const SizedBox(),
      ),
    );
  }
}
