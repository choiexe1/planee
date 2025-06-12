import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.onTapPrevious() = OnTapPrevious;
  const factory HomeAction.onTapNext() = OnTapNext;
  const factory HomeAction.onTapDate(DateTime date) = OnTapDate;
  const factory HomeAction.onLongPressDate(DateTime date) = OnLongPressDate;
}
