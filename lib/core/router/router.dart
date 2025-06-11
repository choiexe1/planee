import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planee/core/router/routes.dart';
import 'package:planee/core/service_locator.dart';
import 'package:planee/presentation/screens/create_event/create_event_screen_root.dart';
import 'package:planee/presentation/view_models/create_event_view_model.dart';

GoRouter appRouter = GoRouter(
  initialLocation: Routes.createEvent,
  routes: [
    GoRoute(
      path: Routes.createEvent,
      builder: (BuildContext context, GoRouterState state) {
        return CreateEventScreenRoot(viewModel: sl<CreateEventViewModel>());
      },
    ),
  ],
);
