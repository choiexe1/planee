extension DateTimeExtension on DateTime {
  String get toKor => '$year년 $month월';

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
  List<DateTime> calculateCalendarDates(int week) {
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
