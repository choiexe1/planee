import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';
import 'package:planee/presentation/components/detail_field.dart';
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
              FormInputField(
                label: Text(
                  '제목',
                  style: AppTextStyle.subTitle1.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                controller: TextEditingController(),
              ),

              DetailField.detailed(
                title: Text(
                  '시간',
                  style: AppTextStyle.subTitle1.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                icon: Icon(Icons.timer_sharp),
                description: Text('오늘, 6월 11일', style: AppTextStyle.body),
                description2: Text(
                  '10:00 - 12:00',
                  style: AppTextStyle.caption.copyWith(color: AppColor.grey),
                ),
              ),
              DetailField.simple(
                title: Text(
                  '알람',
                  style: AppTextStyle.subTitle1.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                icon: Icon(Icons.notifications_outlined),
                description: Text('15분 전 알람', style: AppTextStyle.body),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
