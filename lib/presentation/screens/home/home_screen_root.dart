import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planee/core/router/routes.dart';
import 'package:planee/presentation/screens/home/home_action.dart';
import 'package:planee/presentation/screens/home/home_screen.dart';
import 'package:planee/presentation/view_models/home_view_model.dart';

class HomeScreenRoot extends StatefulWidget {
  const HomeScreenRoot({required this.viewModel, super.key});

  final HomeViewModel viewModel;

  @override
  State<StatefulWidget> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<HomeScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return HomeScreen(
          state: widget.viewModel.state,
          onAction: (HomeAction action) {
            switch (action) {
              case OnTapPrevious():
                widget.viewModel.onAction(action);
              case OnTapNext():
                widget.viewModel.onAction(action);
              case OnTapDate():
                widget.viewModel.onAction(action);
              case OnLongPressDate(:final DateTime date):
                context.push(Routes.createEventWithDate(date));
                widget.viewModel.onAction(action);
            }
          },
        );
      },
    );
  }
}
