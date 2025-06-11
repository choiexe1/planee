import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planee/core/router/routes.dart';
import 'package:planee/presentation/screens/create_event/create_event_screen.dart';

GoRouter appRouter = GoRouter(
  initialLocation: Routes.createEvent,
  routes: [
    GoRoute(
      path: Routes.createEvent,
      builder: (BuildContext context, GoRouterState state) {
        return const CreateEventScreen();
      },
    ),
  ],
);
