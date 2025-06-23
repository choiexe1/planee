import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:planee/core/router/routes.dart';
import 'package:planee/domain/entities/event_entity.dart';
import 'package:planee/presentation/blocs/home_cubit.dart';
import 'package:planee/presentation/screens/home/home_action.dart';
import 'package:planee/presentation/screens/home/home_screen.dart';
import 'package:planee/presentation/screens/home/home_state.dart';

class HomeScreenRoot extends StatelessWidget {
  const HomeScreenRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return BlocSelector<
      HomeCubit,
      HomeState,
      (DateTime, List<DateTime>, DateTime, List<EventEntity>)
    >(
      selector: (state) => (
        state.currentDisplayMonth ?? DateTime.now(),
        state.calendar ?? [],
        state.selectedDate ?? DateTime.now(),
        state.upcomingEvents,
      ),
      builder: (context, props) {
        return HomeScreen(
          currentDisplayMonth: props.$1,
          calendarDates: props.$2,
          selectedDate: props.$3,
          upcomingEvents: props.$4,
          onAction: (action) {
            switch (action) {
              case OnTapPrevious():
                homeCubit.onAction(action);
              case OnTapNext():
                homeCubit.onAction(action);
              case OnTapDate():
                homeCubit.onAction(action);
              case OnLongPressDate(:final DateTime dateTime):
                context.push(Routes.createEventWithDate(dateTime));
                homeCubit.onAction(action);
              case OnTapTitle():
                homeCubit.onAction(action);
            }
          },
        );
      },
    );
  }
}
