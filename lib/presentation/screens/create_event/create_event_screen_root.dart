import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planee/presentation/blocs/create_event/create_event_bloc.dart';
import 'package:planee/presentation/blocs/create_event/create_event_event.dart';
import 'package:planee/presentation/blocs/create_event/create_event_state.dart';
import 'package:planee/presentation/blocs/home/home_bloc.dart';
import 'package:planee/presentation/blocs/home/home_event.dart';
import 'package:planee/presentation/screens/create_event/create_event_screen.dart';

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
    final createEventBloc = context.read<CreateEventBloc>();
    final homeBloc = context.read<HomeBloc>();

    return BlocBuilder<CreateEventBloc, CreateEventState>(
      builder: (context, state) {
        return CreateEventScreen(
          eventTime: state.eventTime,
          alarmTime: state.alarmTime,
          date: widget.date,
          onAction: (CreateEventEvent event) async {
            switch (event) {
              case CreateEventChangeEventTime():
                createEventBloc.add(event);
              case CreateEventSaveAlarmTime():
                createEventBloc.add(event);
              case CreateEventSaveEvent():
                createEventBloc.add(event);
                homeBloc.add(const HomeReloadUpcomingEvents());
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
