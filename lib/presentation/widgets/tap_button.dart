import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';

class TapButton extends StatelessWidget {
  const TapButton({required this.name, required this.onTap, super.key});

  final Text name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: name),
      ),
    );
  }
}
