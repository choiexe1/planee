import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';

class MonthUpDownButton extends StatelessWidget {
  const MonthUpDownButton({
    required this.month,
    required this.onTapUp,
    required this.onTapDown,
    super.key,
  });

  final int month;
  final VoidCallback onTapUp;
  final VoidCallback onTapDown;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '$month월',
            style: AppTextStyle.body.copyWith(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          spacing: 12,
          children: [
            GestureDetector(
              onTap: onTapUp,
              child: const Icon(Icons.keyboard_arrow_up, size: 24),
            ),
            GestureDetector(
              onTap: onTapDown,
              child: const Icon(Icons.keyboard_arrow_down, size: 24),
            ),
          ],
        ),
      ],
    );
  }
}
