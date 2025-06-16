import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planee/core/router/routes.dart';
import 'package:planee/core/service_locator.dart';
import 'package:planee/presentation/screens/create_event/create_event_screen_root.dart';
import 'package:planee/presentation/screens/home/home_screen_root.dart';
import 'package:planee/presentation/view_models/create_event_view_model.dart';
import 'package:planee/presentation/view_models/home_view_model.dart';

GoRouter appRouter = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        final HomeViewModel viewModel = sl()..init();
        return HomeScreenRoot(viewModel: viewModel);
      },
    ),
    GoRoute(
      path: Routes.createEvent,
      builder: (BuildContext context, GoRouterState state) {
        final String dateString = state.pathParameters['date']!;
        final DateTime date = DateTime.parse(dateString);

        final CreateEventViewModel viewModel = sl()..init(date);

        return CreateEventScreenRoot(viewModel: viewModel, date: date);
      },
    ),
  ],
);
