import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:planee/presentation/blocs/home/home_bloc.dart';
import 'package:planee/presentation/blocs/home/home_event.dart';
import 'package:planee/presentation/blocs/home/home_state.dart';
import 'package:planee/presentation/screens/home/home_screen.dart';

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
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.navigationTo.isNotEmpty) {
          context.push(state.navigationTo);
          homeBloc.add(const HomeNavigationComplete());
        }
      },
      builder: (context, state) {
        return HomeScreen(
          currentDisplayMonth: state.currentDisplayMonth,
          calendarDates: state.calendar,
          selectedDate: state.selectedDate,
          upcomingEvents: state.upcomingEvents,
          onAction: (event) async {
            switch (event) {
              case HomeOnTapPrevious():
                homeBloc.add(const HomeOnTapPrevious());
              case HomeOnTapNext():
                homeBloc.add(const HomeOnTapNext());
              case HomeOnTapDate(:final dateTime):
                homeBloc.add(HomeOnTapDate(dateTime));
              case HomeOnLongPressDate(:final dateTime):
                homeBloc.add(HomeOnLongPressDate(dateTime));
              case HomeOnTapCalendarTitle(:final dateTime):
                homeBloc.add(HomeOnTapCalendarTitle(dateTime));
              case HomeInitialize():
                throw UnimplementedError();
              case HomeNavigationComplete():
                throw UnimplementedError();
            }
          },
        );
      },
    );
  }
}
