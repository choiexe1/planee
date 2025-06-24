extension DateTimeExtension on DateTime {
  String get toKor => '$year년 $month월';

  bool get isWeekend =>
      weekday == DateTime.saturday || weekday == DateTime.sunday;
  bool get isSaturday => weekday == DateTime.saturday;
  bool get isSunday => weekday == DateTime.sunday;

  String get dateString => '$year년, $month월 $day일';

  String get dateStringMonthDays =>
      '''$month월 $day일 ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}''';

  String get eventTimeAsString {
    if (hour == 0) {
      return '시간이 지정되지 않았습니다.';
    }

    final formattedHour = hour % 12 == 0 ? 12 : hour % 12;
    final hourString = formattedHour.toString().padLeft(2, '0');

    return minute == 0 ? '$hourString시' : '$hourString시 $minute분';
  }

  String get weekDayAsKorean {
    switch (weekday) {
      case 1:
        return '월';
      case 2:
        return '화';
      case 3:
        return '수';
      case 4:
        return '목';
      case 5:
        return '금';
      case 6:
        return '토';
      case 7:
        return '일';
      default:
        return '';
    }
  }

  String get toEng {
    final monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return '${monthNames[month - 1]} $year';
  }

  DateTime get previousMonth => DateTime(year, month - 1);
  DateTime get nextMonth => DateTime(year, month + 1);

  /// [firstWeekDayOfMonth]는 해당하는 월의 첫째 요일을 [int] 형태로 반환한다.
  /// 월요일(1) ~ 일요일(7)
  int get firstWeekDayOfMonth => DateTime(year, month).weekday;

  /// [week]에 따라 계산할 범위가 정해진다. 불변 리스트 형태로 반환된다.
  /// example: calendarDates(5)는 5주간의 날짜(7 * 5)를 계산한다.
  List<DateTime> calculateCalendarDates({int week = 5}) {
    final dateLength = week * 7;

    final int daysToSubtract = firstWeekDayOfMonth % 7;

    final DateTime calendarStartDate = DateTime(year, month).subtract(
      Duration(days: daysToSubtract),
    );

    final List<DateTime> dates = List.generate(
      dateLength,
      (index) => calendarStartDate.add(Duration(days: index)),
      growable: false,
    );

    return List.unmodifiable(dates);
  }
}
