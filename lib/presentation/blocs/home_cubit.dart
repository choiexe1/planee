import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planee/domain/extension/date_time_extension.dart';
import 'package:planee/domain/use_cases/find_upcoming_events_use_case.dart';
import 'package:planee/presentation/screens/home/home_action.dart';
import 'package:planee/presentation/screens/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._findUpcomingEventsUseCase) : super(const HomeState());

  static const int calendarPerWeek = 5;
  final FindUpcomingEventsUseCase _findUpcomingEventsUseCase;

  Future<void> onAction(HomeAction action) async {
    switch (action) {
      case OnTapPrevious():
        _previousMonth();
      case OnTapNext():
        _nextMonth();
      case OnTapDate(:final DateTime dateTime):
        await _selectDate(dateTime);
      case OnLongPressDate(:final DateTime dateTime):
        await _selectDate(dateTime);
      case OnTapTitle(:final DateTime dateTime):
        await _selectDate(dateTime);
    }
  }

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));

    final now = DateTime.now();

    final upcomingEvents = await _findUpcomingEventsUseCase.execute(
      DateTime(now.year, now.month, now.day, now.hour, now.minute),
      DateTime(now.year, now.month, now.day + 1),
      limit: 5,
    );

    emit(
      state.copyWith(
        selectedDate: now,
        calendar: now.calculateCalendarDates(calendarPerWeek),
        currentDisplayMonth: DateTime(now.year, now.month),
        upcomingEvents: upcomingEvents,
        isLoading: false,
      ),
    );
  }

  void _previousMonth() {
    emit(state.copyWith(isLoading: true));

    final current = state.currentDisplayMonth;
    final previousMonth = current!.previousMonth;

    emit(
      state.copyWith(
        isLoading: false,
        currentDisplayMonth: previousMonth,
        calendar: previousMonth.calculateCalendarDates(calendarPerWeek),
      ),
    );
  }

  void _nextMonth() {
    emit(state.copyWith(isLoading: true));

    final current = state.currentDisplayMonth;
    final nextMonth = current!.nextMonth;

    emit(
      state.copyWith(
        isLoading: false,
        currentDisplayMonth: nextMonth,
        calendar: nextMonth.calculateCalendarDates(calendarPerWeek),
      ),
    );
  }

  Future<void> _selectDate(DateTime date) async {
    emit(state.copyWith(isLoading: true, selectedDate: date));

    final current = state.currentDisplayMonth!;

    if (date.isBefore(current)) {
      emit(
        state.copyWith(
          selectedDate: date,
          currentDisplayMonth: DateTime(date.year, date.month),
          calendar: date.calculateCalendarDates(calendarPerWeek),
        ),
      );
    } else if (date.isAfter(current)) {
      emit(
        state.copyWith(
          selectedDate: date,
          currentDisplayMonth: DateTime(date.year, date.month),
          calendar: date.calculateCalendarDates(calendarPerWeek),
        ),
      );
    } else {
      emit(state.copyWith(selectedDate: date, isLoading: false));
    }
  }
}
