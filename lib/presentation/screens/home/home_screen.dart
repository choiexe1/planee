import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';
import 'package:planee/domain/entities/event_entity.dart';
import 'package:planee/presentation/blocs/home/home_event.dart';
import 'package:planee/presentation/components/calendar.dart';
import 'package:planee/presentation/components/detail_field.dart';
import 'package:planee/presentation/components/upcoming_event_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.currentDisplayMonth,
    required this.calendarDates,
    required this.selectedDate,
    required this.upcomingEvents,
    required this.onAction,
    super.key,
  });

  final DateTime currentDisplayMonth;
  final List<DateTime> calendarDates;
  final DateTime selectedDate;
  final List<EventEntity> upcomingEvents;
  final void Function(HomeEvent event) onAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Calendar(
                currentDisplayMonth: currentDisplayMonth,
                dates: calendarDates,
                onTapDate: (DateTime dateTime) =>
                    onAction(HomeOnTapDate(dateTime)),
                onTapPrevious: () => onAction(const HomeOnTapPrevious()),
                onTapNext: () => onAction(const HomeOnTapNext()),
                selectedDate: selectedDate,
                onLongPressDate: (DateTime dateTime) =>
                    onAction(HomeOnLongPressDate(dateTime)),
                onTapTitle: (dateTime) =>
                    onAction(HomeOnTapCalendarTitle(dateTime)),
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
                  if (upcomingEvents.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...upcomingEvents.map(
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
    );
  }
}
