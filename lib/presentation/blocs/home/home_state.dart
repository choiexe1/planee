import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planee/domain/entities/event_entity.dart';
import 'package:planee/domain/extension/date_time_extension.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required DateTime currentDisplayMonth,
    required List<DateTime> calendar,
    required DateTime selectedDate,
    @Default('') String navigationTo,
    @Default(false) bool isLoading,
    @Default([]) List<EventEntity> upcomingEvents,
  }) = _HomeState;

  const HomeState._();

  factory HomeState.init({int calendarPerWeek = 5}) {
    final now = DateTime.now();

    return HomeState(
      currentDisplayMonth: now,
      selectedDate: now,
      calendar: now.calculateCalendarDates(week: calendarPerWeek),
      upcomingEvents: [],
    );
  }
}
