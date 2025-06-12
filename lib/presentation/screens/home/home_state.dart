import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(null) List<DateTime>? calendar,
    @Default(null) DateTime? selectedDate,
    @Default(null) DateTime? currentDisplayMonth,
  }) = _HomeState;
}
