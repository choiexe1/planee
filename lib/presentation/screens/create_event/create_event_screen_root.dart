import 'package:flutter/material.dart';
import 'package:planee/presentation/screens/create_event/create_event_screen.dart';
import 'package:planee/presentation/view_models/create_event_view_model.dart';

class CreateEventScreenRoot extends StatefulWidget {
  const CreateEventScreenRoot({required this.viewModel, super.key});

  final CreateEventViewModel viewModel;

  @override
  State<StatefulWidget> createState() => _CreateEventScreenRootState();
}

class _CreateEventScreenRootState extends State<CreateEventScreenRoot> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CreateEventScreen(
      onTapSave: ({required String title, required String description}) {
        widget.viewModel.createEvent(title, description);
      },
      titleController: titleController,
      descriptionController: descriptionController,
    );
  }
}
