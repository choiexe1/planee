import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planee/domain/entities/event_entity.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(null) List<DateTime>? calendar,
    @Default(null) DateTime? selectedDate,
    @Default(null) DateTime? currentDisplayMonth,
    @Default([]) List<EventEntity> upcomingEvents,
  }) = _HomeState;
}
