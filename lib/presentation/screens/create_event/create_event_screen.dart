import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';
import 'package:planee/domain/extension/date_time_extension.dart';
import 'package:planee/presentation/components/app_form.dart';
import 'package:planee/presentation/components/detail_field.dart';
import 'package:planee/presentation/components/labeled_form_field.dart';
import 'package:planee/presentation/components/duration_picker.dart';
import 'package:planee/presentation/components/time_picker.dart';
import 'package:planee/presentation/screens/create_event/create_event_action.dart';
import 'package:planee/presentation/screens/create_event/create_event_state.dart';
import 'package:planee/presentation/widgets/box_icon.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({
    required this.state,
    required this.titleController,
    required this.descriptionController,
    required this.locationController,
    required this.onAction,
    required this.date,
    super.key,
  });

  final CreateEventState state;
  final void Function(CreateEventAction action) onAction;
  final DateTime date;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController locationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '일정 추가',
          style: AppTextStyle.subTitle1.copyWith(color: AppColor.black),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: 32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppForm(
                spacing: 12,
                fields: [
                  LabeledFormInputField(
                    controller: titleController,
                    maxLength: 20,
                    label: Text(
                      '제목',
                      style: AppTextStyle.subTitle1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    hintText: '제목을 입력하세요.',
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return '제목을 입력해주세요.';
                      }

                      return null;
                    },
                  ),
                  LabeledFormInputField(
                    controller: descriptionController,
                    maxLines: 4,
                    maxLength: 120,
                    label: Text(
                      '설명',
                      style: AppTextStyle.subTitle1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    hintText: '일정에 관련한 설명을 입력하세요.',
                    validator: (String? value) {
                      return null;
                    },
                  ),
                  LabeledFormInputField(
                    maxLength: 20,
                    controller: locationController,
                    label: Text(
                      '장소',
                      style: AppTextStyle.subTitle1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    hintText: '일정의 장소를 입력해주세요.',
                    validator: (String? value) {
                      return null;
                    },
                  ),
                  DetailField(
                    title: Text(
                      '시간',
                      style: AppTextStyle.subTitle1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    editable: true,
                    onTapEdit: () async {
                      await showDialog<TimeOfDay>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              '시간 선택',
                            ),
                            content: IntrinsicHeight(
                              child: IntrinsicWidth(
                                child: TimePicker(
                                  initialTime: state.timeOfDay,
                                  onTapDone: (TimeOfDay timeOfDay) {
                                    onAction(
                                      CreateEventAction.changeTime(
                                        timeOfDay: timeOfDay,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    children: [
                      const BoxIcon(icon: Icon(Icons.timer_sharp)),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: AppTextStyle.body,
                              children: [
                                TextSpan(
                                  text: date.dateString,
                                  style: AppTextStyle.body.copyWith(
                                    color: AppColor.black,
                                  ),
                                ),
                                TextSpan(
                                  text: ' (${date.weekDayAsKorean})',
                                  style: AppTextStyle.body.copyWith(
                                    color: date.isSaturday
                                        ? AppColor.blue
                                        : date.isSunday
                                        ? AppColor.red
                                        : AppColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            state.timeOfDay.format(context),
                            style: AppTextStyle.caption.copyWith(
                              color: AppColor.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  DetailField(
                    title: Text(
                      '알람',
                      style: AppTextStyle.subTitle1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    editable: true,
                    children: const [
                      BoxIcon(icon: Icon(Icons.notifications_outlined)),
                      SizedBox(width: 16),
                      Text('일정 15분 전 알람'),
                    ],
                    onTapEdit: () async {
                      await showDialog<TimeOfDay>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              '알람 시간 선택',
                            ),
                            content: SizedBox(
                              child: DurationPicker(
                                initialIndex: 0,
                                items: const [
                                  Duration(minutes: 1),
                                  Duration(minutes: 5),
                                  Duration(minutes: 10),
                                  Duration(minutes: 15),
                                  Duration(minutes: 30),
                                  Duration(hours: 1),
                                ],
                                onTapDone: (Duration alarmTime) {
                                  onAction(
                                    CreateEventAction.saveAlarmTime(
                                      alarmTime: alarmTime,
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  DetailField(
                    title: Text(
                      '반복',
                      style: AppTextStyle.subTitle1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    editable: true,
                    children: const [
                      BoxIcon(icon: Icon(Icons.repeat_outlined)),
                      SizedBox(width: 16),
                      Text('일주일마다 반복'),
                    ],
                  ),
                ],
                onSubmitted: () {
                  onAction(
                    CreateEventAction.saveEvent(
                      title: titleController.text,
                      description: descriptionController.text,
                      location: locationController.text,
                    ),
                  );
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
