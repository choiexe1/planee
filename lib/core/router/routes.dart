abstract class Routes {
  static const String home = '/';
  static const String createEvent = '/event/create/:date';
  static const String settings = '/settings';

  static String createEventWithDate(DateTime date) =>
      '/event/create/${date.toIso8601String()}';
}
