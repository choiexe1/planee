import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';
import 'package:planee/domain/extension/date_time_extension.dart';

class Calendar extends StatefulWidget {
  const Calendar({required this.dateTime, super.key});

  final DateTime dateTime;

  @override
  State<StatefulWidget> createState() => _AppCalendarState();
}

class _AppCalendarState extends State<Calendar> {
  late DateTime _currentMonth;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime(widget.dateTime.year, widget.dateTime.month);
    _selectedDate = widget.dateTime;
  }

  void _moveToPreviousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }

  void _moveToNextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }

  Widget _buildDateCell(DateTime date) {
    final isToday =
        date.year == DateTime.now().year &&
        date.month == DateTime.now().month &&
        date.day == DateTime.now().day;

    final isSelected =
        date.year == _selectedDate.year &&
        date.month == _selectedDate.month &&
        date.day == _selectedDate.day;

    final isCurrentMonth = date.month == _currentMonth.month;

    var textColor = AppColor.black;

    if (date.weekday == DateTime.sunday) {
      textColor = AppColor.red;
    } else if (date.weekday == DateTime.saturday) {
      textColor = AppColor.blue;
    }

    if (!isCurrentMonth) {
      textColor = textColor.withValues(alpha: .4);
    }

    BoxDecoration? decoration;
    if (isSelected) {
      decoration = BoxDecoration(
        color: AppColor.blue.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      );
    } else if (isToday) {
      decoration = BoxDecoration(
        border: Border.all(
          color: AppColor.blue,
        ),
        borderRadius: BorderRadius.circular(8),
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _selectedDate = date;
          if (date.month != _currentMonth.month ||
              date.year != _currentMonth.year) {
            _currentMonth = DateTime(date.year, date.month);
          }
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: decoration,
        child: Text(
          date.day.toString(),
          style: AppTextStyle.body.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }

  /// [_getCalendarDates]는 캘린더에 표시될 5주의 날짜를 계산하는 메서드
  List<DateTime> _getCalendarDates() {
    final List<DateTime> dates = [];

    final DateTime firstDayOfMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month,
    );

    final int startWeekday = firstDayOfMonth.weekday;
    int daysToSubtract;

    if (startWeekday == DateTime.sunday) {
      daysToSubtract = 0;
    } else {
      daysToSubtract = startWeekday;
    }

    final DateTime calendarStartDate = firstDayOfMonth.subtract(
      Duration(days: daysToSubtract),
    );

    for (int i = 0; i < 35; i++) {
      dates.add(calendarStartDate.add(Duration(days: i)));
    }
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    final calendarDates = _getCalendarDates();
    final weekDays = ['일', '월', '화', '수', '목', '금', '토'];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: _moveToPreviousMonth,
                child: const Icon(Icons.keyboard_arrow_left, size: 24),
              ),
              Column(
                children: [
                  Text(
                    _currentMonth.toKor(),
                    style: AppTextStyle.subTitle1.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    _currentMonth.toEng(),
                    style: AppTextStyle.subTitle2.copyWith(
                      color: AppColor.grey,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: _moveToNextMonth,
                child: const Icon(Icons.keyboard_arrow_right, size: 24),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: weekDays.map((day) {
              Color textColor = AppColor.black;
              if (day == '일') {
                textColor = AppColor.red;
              } else if (day == '토') {
                textColor = AppColor.blue;
              }
              return Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: AppTextStyle.body.copyWith(
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: calendarDates.length,
              itemBuilder: (context, index) {
                return _buildDateCell(calendarDates[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
