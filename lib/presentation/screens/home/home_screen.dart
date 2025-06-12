import 'package:flutter/material.dart';
import 'package:planee/presentation/components/calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Calendar(dateTime: DateTime.now()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
