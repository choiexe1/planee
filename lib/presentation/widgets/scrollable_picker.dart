import 'package:flutter/material.dart';

class ScrollablePicker extends StatelessWidget {
  const ScrollablePicker({
    required this.controller,
    required this.items,
    required this.onSelectedItemChanged,
    required this.itemBuilder,
    required this.selectedItem,
    super.key,
  });

  final FixedExtentScrollController controller;
  final List<String> items;
  final ValueChanged<int> onSelectedItemChanged;
  final Widget Function(BuildContext context, int) itemBuilder;
  final int selectedItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 40,
        perspective: 0.005,
        diameterRatio: 1.2,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: onSelectedItemChanged,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: itemBuilder,
          childCount: items.length,
        ),
      ),
    );
  }
}
