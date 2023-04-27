import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/bloc/dashboard_bloc.dart';
import 'package:dashboard/src/bloc/dashboard_state.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/dashboard_event.dart';

class DashboardForm extends StatelessWidget {
  const DashboardForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (BuildContext context, DashboardState state) {
        if (state is DashboardLoadingState) {
          return const AppLoader();
        } else if (state is DashboardContentState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text(
                    FlutterI18n.translate(context, 'home.title'),
                    style: AppTextTheme.manrope30SemiBold.copyWith(
                      color: AppTheme.primaryTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<DashboardBloc>(context).add(
                      const RouteToUserProfileEvent(),
                    );
                  },
                  child: DashboardStatisticsWidget(userModel: state.userModel),
                ),
                const SizedBox(height: 11),
                MainAppButton(
                  height: 45,
                  icon: AppIconsTheme.plus,
                  text: 'home.createReport',
                  backgroundColor: AppTheme.buttonBgColor,
                  onPressed: () {
                    BlocProvider.of<DashboardBloc>(context).add(
                      const CreateUserTimeReportEvent(),
                    );
                  },
                ),
                const SizedBox(height: 36),
                Text(
                  FlutterI18n.translate(context, 'home.activities'),
                  style: AppTextTheme.manrope22SemiBold.copyWith(color: AppTheme.primaryTextColor),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemBuilder: (BuildContext context, int index) {
                      final UserReport userReport = state.userReports[index];
                      return ActivityListTileWidget(
                        onPressed: () {
                          BlocProvider.of<DashboardBloc>(context).add(
                            DeleteUserTimeReportEvent(id: userReport.id),
                          );
                        },
                        userReport: userReport,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: AppTheme.accentDividerColor,
                      );
                    },
                    itemCount: state.userReports.length,
                  ),
                )
              ],
            ),
          );
        }
        return AppErrorWidget(
          onPageReload: () {
            BlocProvider.of<DashboardBloc>(context).add(
              const LoadDataEvent(),
            );
          },
        );
      },
    );
  }
}
