import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';
import 'package:planee/presentation/widgets/scrollable_picker.dart';
import 'package:planee/presentation/widgets/tap_button.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({
    required this.initialTime,
    required this.onTapDone,
    super.key,
  });

  final TimeOfDay initialTime;
  final ValueChanged<TimeOfDay> onTapDone;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;

  late int _selectedHour;
  late int _selectedMinute;

  final List<int> _hours = List.generate(24, (index) => index);
  final List<int> _minutes = List.generate(12, (index) => index * 5);

  @override
  void initState() {
    super.initState();
    _selectedHour = widget.initialTime.hour;
    _selectedMinute = widget.initialTime.minute;

    _hourController = FixedExtentScrollController(
      initialItem: _hours.indexOf(_selectedHour),
    );
    _minuteController = FixedExtentScrollController(
      initialItem: _minutes.indexOf(_selectedMinute),
    );
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  void _onSelectionChanged() {
    final newHour = _hours[_hourController.selectedItem];
    final newMinute = _minutes[_minuteController.selectedItem];

    setState(() {
      _selectedHour = newHour;
      _selectedMinute = newMinute;
    });
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
              width: 60,
              height: 180,
              child: ScrollablePicker(
                controller: _hourController,
                items: _hours
                    .map((hour) => hour.toString().padLeft(2, '0'))
                    .toList(),
                selectedItem: _hours.indexOf(_selectedHour),
                onSelectedItemChanged: (index) {
                  _onSelectionChanged();
                },
                itemBuilder: (context, index) {
                  final hour = _hours[index];
                  return Center(
                    child: Text(
                      hour.toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: hour == _selectedHour ? 22 : 18,
                        fontWeight: hour == _selectedHour
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: hour == _selectedHour
                            ? AppColor.blue
                            : AppColor.black,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 60,
              height: 180,
              child: ScrollablePicker(
                controller: _minuteController,
                items: _minutes
                    .map((minute) => minute.toString().padLeft(2, '0'))
                    .toList(),
                selectedItem: _minutes.indexOf(_selectedMinute),
                onSelectedItemChanged: (index) {
                  _onSelectionChanged();
                },
                itemBuilder: (context, index) {
                  final minute = _minutes[index];
                  return Center(
                    child: Text(
                      minute.toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: minute == _selectedMinute ? 22 : 18,
                        fontWeight: minute == _selectedMinute
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: minute == _selectedMinute
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
            widget.onTapDone(
              TimeOfDay(hour: _selectedHour, minute: _selectedMinute),
            );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
