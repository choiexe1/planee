import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';

class BoxIcon extends StatelessWidget {
  const BoxIcon({
    super.key,
    required this.icon,
    this.backgroundColor = AppColor.input,
  });

  final Icon icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
      ),
      child: icon,
    );
  }
}
