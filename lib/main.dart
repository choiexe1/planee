import 'package:flutter/material.dart';
import 'package:planee/presentation/screens/create_event/create_event_screen.dart';

void main() {
  runApp(const AppRouter());
}

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Planee', home: App());
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateEventScreen();
  }
}
