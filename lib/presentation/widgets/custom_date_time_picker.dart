import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateTimeChanged,
    super.key,
  });

  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onDateTimeChanged;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late FixedExtentScrollController _yearController;
  late FixedExtentScrollController _monthController;

  late int _selectedYear;
  late int _selectedMonth;

  final List<int> _years = [];
  final _months = [
    '1월',
    '2월',
    '3월',
    '4월',
    '5월',
    '6월',
    '7월',
    '8월',
    '9월',
    '10월',
    '11월',
    '12월',
  ];

  @override
  void initState() {
    super.initState();
    _selectedYear = widget.initialDate.year;
    _selectedMonth = widget.initialDate.month;

    for (int i = widget.firstDate.year; i <= widget.lastDate.year; i++) {
      _years.add(i);
    }

    _yearController = FixedExtentScrollController(
      initialItem: _years.indexOf(_selectedYear),
    );
    _monthController = FixedExtentScrollController(
      initialItem: _selectedMonth - 1,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onDateTimeChanged(DateTime(_selectedYear, _selectedMonth));
    });
  }

  @override
  void dispose() {
    _yearController.dispose();
    _monthController.dispose();
    super.dispose();
  }

  void _onSelectionChanged() {
    final newYear = _years[_yearController.selectedItem];
    final newMonth = _monthController.selectedItem + 1;

    setState(() {
      _selectedYear = newYear;
      _selectedMonth = newMonth;
    });

    widget.onDateTimeChanged(DateTime(_selectedYear, _selectedMonth));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Row(
            children: [
              Expanded(
                child: ListWheelScrollView.useDelegate(
                  controller: _yearController,
                  itemExtent: 40,
                  perspective: 0.005,
                  diameterRatio: 1.2,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    _onSelectionChanged();
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      final year = _years[index];
                      return Center(
                        child: Text(
                          '$year년',
                          style: TextStyle(
                            fontSize: _years[index] == _selectedYear ? 22 : 18,
                            fontWeight: _years[index] == _selectedYear
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: _years[index] == _selectedYear
                                ? AppColor.blue
                                : AppColor.black,
                          ),
                        ),
                      );
                    },
                    childCount: _years.length,
                  ),
                ),
              ),
              Expanded(
                child: ListWheelScrollView.useDelegate(
                  controller: _monthController,
                  itemExtent: 40,
                  perspective: 0.005,
                  diameterRatio: 1.2,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    _onSelectionChanged();
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      final month = _months[index];
                      return Center(
                        child: Text(
                          month,
                          style: AppTextStyle.body.copyWith(
                            fontSize: (index + 1) == _selectedMonth ? 22 : 18,
                            fontWeight: (index + 1) == _selectedMonth
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: (index + 1) == _selectedMonth
                                ? AppColor.blue
                                : AppColor.black,
                          ),
                        ),
                      );
                    },
                    childCount: _months.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
