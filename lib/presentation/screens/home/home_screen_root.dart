import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planee/presentation/blocs/home/home_bloc.dart';
import 'package:planee/presentation/blocs/home/home_event.dart';
import 'package:planee/presentation/screens/home/home_action.dart';
import 'package:planee/presentation/screens/home/home_screen.dart';
import 'package:planee/presentation/screens/home/home_state.dart';

class HomeScreenRoot extends StatefulWidget {
  const HomeScreenRoot({super.key});

  @override
  State<HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<HomeScreenRoot> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = context.read<HomeBloc>();
    homeBloc.add(const HomeInitialize());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return HomeScreen(
          currentDisplayMonth: state.currentDisplayMonth,
          calendarDates: state.calendar,
          selectedDate: state.selectedDate,
          upcomingEvents: state.upcomingEvents,
          onAction: (action) async {
            switch (action) {
              case OnTapPrevious():
                homeBloc.add(const HomeOnTapPrevious());
              case OnTapNext():
                homeBloc.add(const HomeOnTapNext());
              case OnTapDate(:final DateTime dateTime):
                homeBloc.add(HomeOnTapDate(dateTime));
              case OnLongPressDate(:final DateTime dateTime):
              // await context.push(Routes.createEventWithDate(dateTime));
              // await homeCubit.onAction(action);
              // await homeCubit.refreshUpcomingEvents();
              case OnTapTitle():
              // await homeCubit.onAction(action);
            }
          },
        );
      },
    );
  }
}
