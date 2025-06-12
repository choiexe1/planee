extension DateTimeExtension on DateTime {
  String toKor() {
    return '$year년 $month월 $day일';
  }

  String toEng() {
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

    if (month >= 1 && month <= 12) {
      return '${monthNames[month - 1]}, $year';
    } else {
      throw Exception('올바른 날짜를 입력하세요.');
    }
  }
}
