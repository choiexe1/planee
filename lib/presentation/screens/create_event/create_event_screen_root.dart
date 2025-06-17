import 'package:flutter/material.dart';
import 'package:planee/presentation/screens/create_event/create_event_action.dart';
import 'package:planee/presentation/screens/create_event/create_event_screen.dart';
import 'package:planee/presentation/view_models/create_event_view_model.dart';

class CreateEventScreenRoot extends StatefulWidget {
  const CreateEventScreenRoot({
    required this.viewModel,
    required this.date,
    super.key,
  });

  final CreateEventViewModel viewModel;
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
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (BuildContext context, Widget? child) {
        return CreateEventScreen(
          state: widget.viewModel.state,
          date: widget.date,
          onAction: (CreateEventAction action) async {
            switch (action) {
              case SaveEvent():
                await widget.viewModel.onAction(action);
              case ChangeTime():
                await widget.viewModel.onAction(action);
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
