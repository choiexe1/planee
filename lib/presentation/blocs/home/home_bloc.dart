import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planee/core/router/routes.dart';
import 'package:planee/domain/extension/date_time_extension.dart';
import 'package:planee/domain/use_cases/find_upcoming_events_use_case.dart';
import 'package:planee/presentation/blocs/home/home_event.dart';
import 'package:planee/presentation/screens/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._findUpcomingEventsUseCase) : super(HomeState.init()) {
    on<HomeInitialize>(_init);
    on<HomeOnTapNext>(_nextMonth);
    on<HomeOnTapPrevious>(_previousMonth);
    on<HomeOnTapDate>(_selectDate);
    on<HomeOnTapCalendarTitle>(_moveDate);
    on<HomeOnLongPressDate>(_dateLongPressed);
    on<HomeNavigationComplete>(_navigationComplete);
  }

  final FindUpcomingEventsUseCase _findUpcomingEventsUseCase;

  Future<void> _init(HomeInitialize event, Emitter<HomeState> emit) async {
    final now = DateTime.now();

    final upcomingEvents = await _findUpcomingEventsUseCase.execute(
      start: DateTime(now.year, now.month, now.day, now.hour, now.minute),
      end: DateTime(now.year, now.month, now.day + 1),
      limit: 5,
    );

    emit(state.copyWith(upcomingEvents: upcomingEvents));
  }

  void _nextMonth(HomeOnTapNext event, Emitter<HomeState> emit) {
    final nextMonth = state.currentDisplayMonth.nextMonth;

    emit(
      state.copyWith(
        currentDisplayMonth: nextMonth,
        calendar: nextMonth.calculateCalendarDates(),
      ),
    );
  }

  void _previousMonth(HomeOnTapPrevious event, Emitter<HomeState> emit) {
    final previousMonth = state.currentDisplayMonth.previousMonth;

    emit(
      state.copyWith(
        currentDisplayMonth: previousMonth,
        calendar: previousMonth.calculateCalendarDates(),
      ),
    );
  }

  void _selectDate(HomeOnTapDate event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedDate: event.dateTime));
  }

  void _moveDate(HomeOnTapCalendarTitle event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        selectedDate: event.dateTime,
        currentDisplayMonth: event.dateTime,
        calendar: event.dateTime.calculateCalendarDates(),
      ),
    );
  }

  void _dateLongPressed(HomeOnLongPressDate event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        currentDisplayMonth: event.dateTime,
        calendar: event.dateTime.calculateCalendarDates(),
        navigationTo: Routes.createEventWithDate(event.dateTime),
        selectedDate: event.dateTime,
      ),
    );
  }

  void _navigationComplete(
    HomeNavigationComplete event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(navigationTo: ''));
  }
}
