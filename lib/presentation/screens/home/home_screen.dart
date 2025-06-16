import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';
import 'package:planee/presentation/components/calendar.dart';
import 'package:planee/presentation/components/detail_field.dart';
import 'package:planee/presentation/components/upcoming_event_tile.dart';
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
                Calendar(
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
                DetailField(
                  title: Text(
                    '다가오는 일정',
                    style: AppTextStyle.subTitle1.copyWith(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    if (state.upcomingEvents.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...state.upcomingEvents.map(
                            (event) => UpcomingEventTile(event: event),
                          ),
                        ],
                      )
                    else
                      Text(
                        '다가오는 일정이 없어요!',
                        style: AppTextStyle.body.copyWith(
                          color: AppColor.grey,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
