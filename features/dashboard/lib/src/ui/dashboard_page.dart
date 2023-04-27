import 'package:core/core.dart';
import 'package:dashboard/src/bloc/dashboard_bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'dashboard_screen.dart';

class DashboardFeature {
  static Page<dynamic> page() => HomePage();
}

class HomePage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => ScaffoldMessenger(
        child: BlocProvider<DashboardBloc>(
          create: (_) {
            return DashboardBloc(
              appRouter: appLocator.get<AppRouterDelegate>(),
              getUserReportsUsecase: appLocator.get<GetUserReportsUsecase>(),
              getUserInformationUseCase: appLocator.get<GetUserInformationUseCase>(),
              observeReportsAddedUsecase: appLocator.get<ObserveReportsAddedUsecase>(),
              deleteCustomerReportUseCase: appLocator.get<DeleteCustomerReportUseCase>(),
            );
          },
          child: const DashboardScreen(),
        ),
      ),
      settings: this,
    );
  }
}
