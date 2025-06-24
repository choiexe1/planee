import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_push_notifications_module/domain/use_cases/scheduled_push_use_case.dart';
import 'package:permission_handler_module/domain/enum/permission_type.dart';
import 'package:permission_handler_module/domain/use_cases/permission_check_use_case.dart';
import 'package:planee/domain/use_cases/create_event_use_case.dart';
import 'package:planee/presentation/blocs/create_event/create_event_event.dart';
import 'package:planee/presentation/blocs/create_event/create_event_state.dart';

class CreateEventBloc extends Bloc<CreateEventEvent, CreateEventState> {
  CreateEventBloc(
    this._permissionCheckUseCase,
    this._scheduledPushUseCase,
    this._createEventUseCase,
  ) : super(CreateEventState.init()) {
    on<CreateEventChangeEventTime>(_changeEventTime);
    on<CreateEventSaveAlarmTime>(_saveAlarmTime);
    on<CreateEventSaveEvent>(_saveEvent);
  }

  final PermissionCheckUseCase _permissionCheckUseCase;
  final CreateEventUseCase _createEventUseCase;
  final ScheduledPushUseCase _scheduledPushUseCase;

  void _changeEventTime(
    CreateEventChangeEventTime event,
    Emitter<CreateEventState> emit,
  ) {
    final eventTime = state.eventTime.copyWith(
      hour: event.timeOfDay.hour,
      minute: event.timeOfDay.minute,
    );

    emit(state.copyWith(eventTime: eventTime));
  }

  Future<void> _saveAlarmTime(
    CreateEventSaveAlarmTime event,
    Emitter<CreateEventState> emit,
  ) async {
    await _permissionCheckUseCase.execute(PermissionType.notification);

    emit(state.copyWith(alarmTime: event.alarmTime));
  }

  Future<void> _saveEvent(
    CreateEventSaveEvent event,
    Emitter<CreateEventState> emit,
  ) async {
    final DateTime eventTime = state.eventTime;
    final DateTime exactAlarmTime = eventTime.subtract(state.alarmTime);

    await _createEventUseCase.execute(
      event.title,
      event.description,
      event.location,
      eventTime,
    );

    await _scheduledPushUseCase.execute(
      id: 1,
      title: 'Planee',
      body: '${event.title} 일정이 다가와요!',
      dateTime: exactAlarmTime,
    );
  }
}
