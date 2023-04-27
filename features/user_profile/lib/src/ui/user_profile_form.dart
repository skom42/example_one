import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:user_profile/src/bloc/user_profile_bloc.dart';
import 'package:user_profile/src/bloc/user_profile_state.dart';

class UserProfileForm extends StatelessWidget {
  const UserProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (BuildContext context, UserProfileState state) {
        if (state is UserProfileLoadingState) {
          return const AppLoader();
        } else if (state is UserProfileContentState) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.centerLeft,
                colors: AppTheme.userProfileGradient,
              ),
            ),
            child: Column(
              children: <Widget>[
                const TopBarWithIconsWidget(),
                const SizedBox(height: 40),
                AppNetworkImage(
                  width: 144,
                  height: 144,
                  imageURL: state.userModel.profileImageUrl,
                ),
                const SizedBox(height: 14),
                Text(
                  StringUtils.getFullUserName(
                    firstName: state.userModel.firstName,
                    lastName: state.userModel.lastName,
                  ),
                  style: AppTextTheme.manrope28Bold.copyWith(color: AppTheme.primaryTextColor),
                ),
                const SizedBox(height: 4),
                Text(
                  state.userModel.department,
                  style: AppTextTheme.manrope16Medium,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppTheme.buttonBgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: NumericUtils.volunteeredHourCount(
                        hourVolunteered: state.userModel.hourVolunteered,
                      ),
                      style: AppTextTheme.manrope16Bold.copyWith(
                        color: AppTheme.backgroundPrimaryColor,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text: FlutterI18n.translate(context, 'home.statisticsHours'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
