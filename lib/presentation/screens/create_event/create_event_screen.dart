import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';
import 'package:planee/domain/extension/date_time_extension.dart';
import 'package:planee/presentation/components/detail_field.dart';
import 'package:planee/presentation/components/time_picker.dart';
import 'package:planee/presentation/screens/create_event/create_event_action.dart';
import 'package:planee/presentation/screens/create_event/create_event_state.dart';
import 'package:planee/presentation/widgets/box_icon.dart';
import 'package:planee/presentation/widgets/input_field.dart';
import 'package:planee/presentation/widgets/tap_button.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({
    required this.state,
    required this.titleController,
    required this.descriptionController,
    required this.onAction,
    required this.date,
    super.key,
  });

  final CreateEventState state;
  final void Function(CreateEventAction action) onAction;
  final DateTime date;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '일정 추가',
          style: AppTextStyle.subTitle1.copyWith(color: AppColor.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 24,
              children: [
                DetailField(
                  title: Text(
                    '제목',
                    style: AppTextStyle.subTitle1.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  children: [
                    Expanded(
                      child: InputField(controller: titleController),
                    ),
                  ],
                ),
                DetailField(
                  title: Text(
                    '설명',
                    style: AppTextStyle.subTitle1.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  children: [
                    Expanded(
                      child: InputField(
                        controller: descriptionController,
                        maxLines: 4,
                      ),
                    ),
                  ],
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
                    Text('15분 전 알람'),
                  ],
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
                DetailField(
                  title: Text(
                    '장소',
                    style: AppTextStyle.subTitle1.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  children: [
                    Expanded(
                      child: InputField(controller: TextEditingController()),
                    ),
                  ],
                ),
                TapButton(
                  name: Text(
                    '저장',
                    style: AppTextStyle.subTitle2.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                  ),
                  onTap: () {
                    onAction(
                      CreateEventAction.saveEvent(
                        title: titleController.text,
                        description: descriptionController.text,
                      ),
                    );
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
