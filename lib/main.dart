import 'package:flutter/material.dart';
import 'package:planee/core/router/router.dart';
import 'package:planee/core/service_locator.dart';
import 'package:planee/core/ui/app_color.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.white,
        appBarTheme: const AppBarTheme(backgroundColor: AppColor.white),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
