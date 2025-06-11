import 'package:flutter/material.dart';
import 'package:planee/core/router/router.dart';
import 'package:planee/core/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injection();

  await sl.allReady();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
