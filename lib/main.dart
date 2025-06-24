import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planee/core/router/router.dart';
import 'package:planee/core/service_locator.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/presentation/blocs/home/home_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => sl<HomeBloc>()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.white,
          appBarTheme: const AppBarTheme(backgroundColor: AppColor.white),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}
