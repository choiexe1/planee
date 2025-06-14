import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';
import 'package:planee/domain/extension/date_time_extension.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    required this.selectedDate,
    required this.dates,
    required this.onTapPrevious,
    required this.onTapNext,
    required this.onTapDate,
    required this.onLongPressDate,
    required this.currentDisplayMonth,
    required this.onTapTitle,
    super.key,
  });

  static const List<String> _weekDays = ['일', '월', '화', '수', '목', '금', '토'];

  final DateTime selectedDate;
  final DateTime currentDisplayMonth;
  final List<DateTime> dates;
  final VoidCallback onTapPrevious;
  final VoidCallback onTapNext;
  final void Function(DateTime dateTime) onLongPressDate;
  final void Function(DateTime dateTime) onTapDate;
  final void Function(DateTime dateTime) onTapTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onTapPrevious,
                child: const Icon(Icons.keyboard_arrow_left, size: 24),
              ),
              GestureDetector(
                onTap: () {
                  onTapTitle(DateTime.now());
                },
                child: Column(
                  children: [
                    Text(
                      currentDisplayMonth.toKor,
                      style: AppTextStyle.subTitle1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      currentDisplayMonth.toEng,
                      style: AppTextStyle.subTitle2.copyWith(
                        color: AppColor.grey,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onTapNext,
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
            children: _weekDays.map((day) {
              Color textColor = AppColor.black;

              switch (day) {
                case '일':
                  textColor = AppColor.red;
                case '토':
                  textColor = AppColor.blue;
              }

              return Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: AppTextStyle.body.copyWith(
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
              itemCount: dates.length,
              itemBuilder: (context, index) {
                return _buildDateCell(
                  dates[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateCell(
    DateTime date,
  ) {
    final isToday =
        date.year == DateTime.now().year &&
        date.month == DateTime.now().month &&
        date.day == DateTime.now().day;

    final isSelected =
        date.year == selectedDate.year &&
        date.month == selectedDate.month &&
        date.day == selectedDate.day;

    final isCurrentMonth = date.month == currentDisplayMonth.month;

    Color textColor = AppColor.black;

    if (date.weekday == DateTime.sunday) {
      textColor = AppColor.red;
    } else if (date.weekday == DateTime.saturday) {
      textColor = AppColor.blue;
    }

    if (!isCurrentMonth) {
      textColor = textColor.withValues(alpha: 0.4);
    }

    BoxDecoration? decoration;
    if (isSelected) {
      decoration = BoxDecoration(
        color: AppColor.blue.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTapDate(date),
      onLongPress: () {
        HapticFeedback.vibrate();
        onLongPressDate(date);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: decoration,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  date.day.toString(),
                  style: AppTextStyle.body.copyWith(color: textColor),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            if (isToday)
              Positioned(
                bottom: 4,
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: AppColor.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
