import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:user_profile/src/bloc/user_profile_bloc.dart';

import 'user_profile_screen.dart';

class UserProfileFeature {
  static Page<dynamic> page({
    required bool isReroute,
    required UserModel userModel,
  }) =>
      UserProfilePage(
        isReroute: isReroute,
        userModel: userModel,
      );
}

class UserProfilePage extends Page<void> {
  final bool isReroute;
  final UserModel userModel;

  const UserProfilePage({
    required this.isReroute,
    required this.userModel,
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => ScaffoldMessenger(
        child: BlocProvider<UserProfileBloc>(
          create: (_) {
            return UserProfileBloc(
              isReroute: isReroute,
              userModel: userModel,
              appRouter: appLocator.get<AppRouterDelegate>(),
              createReportUseCase: appLocator.get<CreateReportUseCase>(),
            );
          },
          child: const UserProfileScreen(),
        ),
      ),
      settings: this,
    );
  }
}
