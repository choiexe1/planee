import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:planee/core/router/routes.dart';
import 'package:planee/core/service_locator.dart';
import 'package:planee/presentation/blocs/create_event/create_event_bloc.dart';
import 'package:planee/presentation/components/app_scaffold.dart';
import 'package:planee/presentation/screens/create_event/create_event_screen_root.dart';
import 'package:planee/presentation/screens/home/home_screen_root.dart';
import 'package:planee/presentation/screens/settings/settings_screen_root.dart';

GoRouter appRouter = GoRouter(
  initialLocation: Routes.home,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (BuildContext context, GoRouterState state) {
                return const HomeScreenRoot();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.settings,
              builder: (BuildContext context, GoRouterState state) {
                return SettingsScreenRoot();
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.createEvent,
      builder: (BuildContext context, GoRouterState state) {
        final String dateString = state.pathParameters['date']!;
        final DateTime date = DateTime.parse(dateString);

        return BlocProvider<CreateEventBloc>(
          create: (context) => sl<CreateEventBloc>(),
          child: CreateEventScreenRoot(date: date),
        );
      },
    ),
  ],
);
