import 'package:flutter/material.dart';
import 'package:planee/presentation/components/calendar.dart';
import 'package:planee/presentation/screens/home/home_action.dart';
import 'package:planee/presentation/screens/home/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.state, required this.onAction, super.key});

  final HomeState state;
  final void Function(HomeAction action) onAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Calendar(
                    currentDisplayMonth:
                        state.currentDisplayMonth ?? DateTime.now(),
                    dates: state.calendar ?? [],
                    selectedDate: state.selectedDate ?? DateTime.now(),
                    onTapTitle: (DateTime dateTime) =>
                        onAction(HomeAction.onTapTitle(dateTime)),
                    onTapPrevious: () =>
                        onAction(const HomeAction.onTapPrevious()),
                    onTapNext: () => onAction(const HomeAction.onTapNext()),
                    onTapDate: (DateTime dateTime) =>
                        onAction(HomeAction.onTapDate(dateTime)),
                    onLongPressDate: (DateTime dateTime) =>
                        onAction(HomeAction.onLongPressDate(dateTime)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
