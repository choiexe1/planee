import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:planee/core/router/routes.dart';
import 'package:planee/core/service_locator.dart';
import 'package:planee/presentation/blocs/create_event_cubit.dart';
import 'package:planee/presentation/blocs/home/home_bloc.dart';
import 'package:planee/presentation/screens/create_event/create_event_screen_root.dart';
import 'package:planee/presentation/screens/home/home_screen_root.dart';

GoRouter appRouter = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => sl<HomeBloc>(),
          child: const HomeScreenRoot(),
        );
      },
    ),
    GoRoute(
      path: Routes.createEvent,
      builder: (BuildContext context, GoRouterState state) {
        final String dateString = state.pathParameters['date']!;
        final DateTime date = DateTime.parse(dateString);

        return BlocProvider(
          create: (context) => sl<CreateEventCubit>()..init(date),
          child: CreateEventScreenRoot(date: date),
        );
      },
    ),
  ],
);
