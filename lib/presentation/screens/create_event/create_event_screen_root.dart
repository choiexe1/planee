import 'package:flutter/material.dart';
import 'package:planee/data/dto/event_dto.dart';
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
      onTapSave: (EventDTO dto) {
        widget.viewModel.createEvent(dto);
      },
      titleController: titleController,
      descriptionController: descriptionController,
    );
  }
}
