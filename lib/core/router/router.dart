import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planee/core/router/routes.dart';
import 'package:planee/core/service_locator.dart';
import 'package:planee/presentation/screens/create_event/create_event_screen_root.dart';
import 'package:planee/presentation/screens/home/home_screen_root.dart';

GoRouter appRouter = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreenRoot(viewModel: sl());
      },
    ),
    GoRoute(
      path: Routes.createEvent,
      builder: (BuildContext context, GoRouterState state) {
        final String dateString = state.pathParameters['date']!;
        final DateTime date = DateTime.parse(dateString);

        return CreateEventScreenRoot(viewModel: sl(), date: date);
      },
    ),
  ],
);
