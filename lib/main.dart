import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_text_style.dart';
import 'package:planee/presentation/components/form_input_field.dart';
import 'package:planee/presentation/widgets/app_check_box.dart';
import 'package:planee/presentation/widgets/box_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Planee', home: App());
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('상세 일정'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 12,
            children: [
              AppCheckbox(),
              BoxIcon(icon: Icon(Icons.timer_sharp)),
              Center(
                child: FormInputField(
                  label: Text(
                    '제목',
                    style: AppTextStyle.subTitle1.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
