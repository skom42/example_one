import 'package:core/utils/date_time_utils.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../core_ui.dart';

class ActivityListTileWidget extends StatelessWidget {
  final Function onPressed;
  final UserReport userReport;

  const ActivityListTileWidget({
    required this.onPressed,
    required this.userReport,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              userReport.title,
              style: AppTextTheme.manrope16SemiBold.copyWith(color: AppTheme.primaryTextColor),
            ),
            const SizedBox(height: 2),
            Text(
              userReport.initiatorTitle,
              style: AppTextTheme.manrope14Regular.copyWith(color: AppTheme.primaryTextColor),
            ),
            Row(
              children: <Widget>[
                Text(
                  DateTimeUtils.DD_MM_YYYY.format(userReport.creationDate),
                  style: AppTextTheme.manrope16SemiBold.copyWith(
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
                Text(
                  DateTimeUtils.getStartEndInterval(
                    timeEnd: userReport.endTime,
                    timeStart: userReport.startTime,
                  ),
                  style: AppTextTheme.manrope16SemiBold.copyWith(
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
        GestureDetector(
          onTap: () {
            onPressed();
          },
          child: AppIconsTheme.trashBasket.call(size: 40),
        ),
      ],
    );
  }
}
