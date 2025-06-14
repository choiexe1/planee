import 'package:flutter/cupertino.dart';
import 'package:planee/domain/extension/date_time_extension.dart';
import 'package:planee/presentation/screens/home/home_action.dart';
import 'package:planee/presentation/screens/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  HomeViewModel();

  static const int calendarPerWeek = 5;

  HomeState _state = const HomeState();

  HomeState get state => _state;

  Future<void> onAction(HomeAction action) async {
    switch (action) {
      case OnTapPrevious():
        _previous();
      case OnTapNext():
        _next();
      case OnTapDate(:final DateTime dateTime):
        _select(dateTime);
      case OnLongPressDate(:final DateTime dateTime):
        _select(dateTime);
      case OnTapTitle(:final DateTime dateTime):
        _select(dateTime);
    }
  }

  void init() {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final now = DateTime.now();

    _state = _state.copyWith(
      selectedDate: now,
      calendar: now.calculateCalendarDates(5),
      currentDisplayMonth: DateTime(now.year, now.month),
      isLoading: false,
    );

    notifyListeners();
  }

  void _previous() {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final current = _state.currentDisplayMonth;
    final previousMonth = current!.previousMonth;

    _state = _state.copyWith(
      isLoading: false,
      currentDisplayMonth: previousMonth,
      calendar: previousMonth.calculateCalendarDates(calendarPerWeek),
    );

    notifyListeners();
  }

  void _next() {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final current = _state.currentDisplayMonth;
    final nextMonth = current!.nextMonth;

    _state = _state.copyWith(
      isLoading: false,
      currentDisplayMonth: nextMonth,
      calendar: nextMonth.calculateCalendarDates(calendarPerWeek),
    );

    notifyListeners();
  }

  void _select(DateTime date) {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final current = _state.currentDisplayMonth!;

    if (date.isBefore(current)) {
      _state = _state.copyWith(
        selectedDate: date,
        currentDisplayMonth: DateTime(date.year, date.month),
        calendar: date.calculateCalendarDates(calendarPerWeek),
      );
    } else if (date.isAfter(current)) {
      _state = _state.copyWith(
        selectedDate: date,
        currentDisplayMonth: DateTime(date.year, date.month),
        calendar: date.calculateCalendarDates(calendarPerWeek),
      );
    } else {
      _state = _state.copyWith(selectedDate: date, isLoading: false);
    }

    notifyListeners();
  }
}
