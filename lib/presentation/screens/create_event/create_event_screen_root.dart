import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planee/presentation/blocs/create_event_cubit.dart';
import 'package:planee/presentation/screens/create_event/create_event_action.dart';
import 'package:planee/presentation/screens/create_event/create_event_screen.dart';
import 'package:planee/presentation/screens/create_event/create_event_state.dart';

class CreateEventScreenRoot extends StatefulWidget {
  const CreateEventScreenRoot({
    required this.date,
    super.key,
  });

  final DateTime date;

  @override
  State<StatefulWidget> createState() => _CreateEventScreenRootState();
}

class _CreateEventScreenRootState extends State<CreateEventScreenRoot> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createEventCubit = context.read<CreateEventCubit>();

    return BlocBuilder<CreateEventCubit, CreateEventState>(
      builder: (context, state) {
        return CreateEventScreen(
          state: createEventCubit.state,
          date: widget.date,
          onAction: (CreateEventAction action) async {
            switch (action) {
              case SaveEvent():
                await createEventCubit.onAction(action);
              case ChangeTime():
                await createEventCubit.onAction(action);
              case SaveAlarmTime():
                await createEventCubit.onAction(action);
            }
          },
          titleController: titleController,
          descriptionController: descriptionController,
          locationController: locationController,
        );
      },
    );
  }
}
