import 'package:flutter/material.dart';
import 'package:planee/core/ui/app_color.dart';
import 'package:planee/core/ui/app_text_style.dart';
import 'package:planee/domain/entities/event_entity.dart';
import 'package:planee/domain/extension/date_time_extension.dart';
import 'package:planee/presentation/widgets/app_check_box.dart';

class UpcomingEventTile extends StatelessWidget {
  const UpcomingEventTile({required this.event, super.key});

  final EventEntity event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          spacing: 8,
          children: [
            const AppCheckbox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.title, style: AppTextStyle.subTitle2),
                Text(
                  event.eventTime.dateStringMonthDays,
                  style: AppTextStyle.caption.copyWith(color: AppColor.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
