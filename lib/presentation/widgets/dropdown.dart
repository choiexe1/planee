import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';

class Dropdown<T> extends StatefulWidget {
  const Dropdown({
    required this.list,
    required this.initialItem,
    required this.onChanged,
    super.key,
  });

  final List<T> list;
  final T initialItem;
  final ValueChanged<T?> onChanged;

  @override
  State<Dropdown<T>> createState() => _DropdownState<T>();
}

class _DropdownState<T> extends State<Dropdown<T>> {
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      initialSelection: _selectedItem,
      dropdownMenuEntries: _buildDropdownMenuEntries(),
      onSelected: (T? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedItem = newValue;
          });
          widget.onChanged(newValue);
        }
      },
      textStyle: AppTextStyle.body.copyWith(
        color: AppColor.white,
        fontWeight: FontWeight.bold,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColor.blue,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      trailingIcon: const Icon(
        Icons.keyboard_arrow_down,
        color: AppColor.white,
        size: 24,
      ),
      selectedTrailingIcon: const Icon(
        Icons.keyboard_arrow_up,
        color: AppColor.white,
        size: 24,
      ),
    );
  }

  List<DropdownMenuEntry<T>> _buildDropdownMenuEntries() {
    return widget.list
        .map(
          (x) => DropdownMenuEntry<T>(
            label: x is String ? x : x.toString(),
            value: x,
          ),
        )
        .toList();
  }
}
