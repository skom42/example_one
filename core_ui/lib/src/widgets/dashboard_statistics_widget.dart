import 'package:core/core.dart';
import 'package:domain/user/user_library.dart';
import 'package:flutter/material.dart';

import '../../core_ui.dart';
import 'home_statistics_text_widget.dart';

class DashboardStatisticsWidget extends StatelessWidget {
  final UserModel userModel;

  const DashboardStatisticsWidget({
    required this.userModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: AppTheme.dashboardGradient,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              HomeStatisticsTextWidget(
                title: NumericUtils.volunteeredHourCount(
                  hourVolunteered: userModel.hourVolunteered,
                ),
                description: FlutterI18n.translate(context, 'home.statisticsHours'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: VerticalDivider(
                  color: AppTheme.dividerColor,
                  width: 1,
                ),
              ),
              HomeStatisticsTextWidget(
                title: userModel.volunteerActivities != null
                    ? userModel.volunteerActivities.toString()
                    : GlobalConstants.dashboardActivityPlaceholder,
                description: FlutterI18n.translate(context, 'home.statisticsActivities'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
