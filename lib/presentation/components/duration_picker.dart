import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';
import 'package:planee/presentation/widgets/scrollable_picker.dart';
import 'package:planee/presentation/widgets/tap_button.dart';

class DurationPicker extends StatefulWidget {
  const DurationPicker({
    required this.initialIndex,
    required this.onTapDone,
    required this.items,
    super.key,
  });

  final int initialIndex;
  final List<Duration> items;
  final ValueChanged<Duration> onTapDone;

  @override
  State<DurationPicker> createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  late FixedExtentScrollController _controller;

  late int _initialValueIndex;
  late List<Duration> _values;
  late Duration _selectedValue;

  @override
  void initState() {
    super.initState();
    _initialValueIndex = widget.initialIndex;
    _values = widget.items;
    _selectedValue = _values[_initialValueIndex];

    _controller = FixedExtentScrollController(
      initialItem: _initialValueIndex,
    );
  }

  void _onSelectionChanged() {
    final newValue = _values[_controller.selectedItem];

    setState(() {
      _selectedValue = newValue;
    });
  }

  String _formatDuration(Duration duration) {
    if (duration.inMinutes < 60) {
      return '${duration.inMinutes}분 전';
    } else {
      final hours = duration.inHours;
      final minutes = duration.inMinutes % 60;
      if (minutes == 0) {
        return '$hours시간 전';
      } else {
        return '$hours시간 $minutes분 전';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 180,
              child: ScrollablePicker(
                controller: _controller,
                items: _values.map(_formatDuration).toList(),
                selectedItem: _values.indexOf(
                  _selectedValue,
                ),
                onSelectedItemChanged: (index) {
                  _onSelectionChanged();
                },
                itemBuilder: (context, index) {
                  final item = _values[index];
                  return Center(
                    child: Text(
                      _formatDuration(item),
                      style: TextStyle(
                        fontSize: item == _selectedValue ? 22 : 18,
                        fontWeight: item == _selectedValue
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: item == _selectedValue
                            ? AppColor.blue
                            : AppColor.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        TapButton(
          name: Text(
            '완료',
            style: AppTextStyle.body.copyWith(
              color: AppColor.white,
            ),
          ),
          onTap: () {
            widget.onTapDone(_selectedValue);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
