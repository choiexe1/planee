import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.initialize() = HomeInitialize;
  const factory HomeEvent.onTapPrevious() = HomeOnTapPrevious;
  const factory HomeEvent.onTapNext() = HomeOnTapNext;
  const factory HomeEvent.onTapDate(DateTime dateTime) = HomeOnTapDate;
  const factory HomeEvent.onLongPressDate(DateTime dateTime) =
      HomeOnLongPressDate;
  const factory HomeEvent.onTapTitle(DateTime dateTime) =
      HomeOnTapCalendarTitle;
  const factory HomeEvent.reloadUpcomingEvents() = HomeReloadUpcomingEvents;
  const factory HomeEvent.navigationComplete() = HomeNavigationComplete;
}
