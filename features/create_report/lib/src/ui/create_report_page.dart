import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:create_report/src/bloc/create_report_bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'create_report_screen.dart';

class CreateReportFeature {
  static Page<CreateReportPayload?> page() {
    return _CreateReportDrawerPage();
  }
}

class _CreateReportDrawerPage extends Page<CreateReportPayload?> {
  @override
  Route<CreateReportPayload?> createRoute(BuildContext context) {
    return BottomSlideRoute<CreateReportPayload?>(
      customHeight: MediaQuery.of(context).size.height * 0.5,
      settings: this,
      builder: (_) {
        return BlocProvider<CreateReportBloc>(
          create: (BuildContext context) {
            return CreateReportBloc(
              appRouter: appLocator.get<AppRouterDelegate>(),
              getEventsUseCase: appLocator.get<GetEventsUseCase>(),
            );
          },
          child: const CreateReportScreen(),
        );
      },
    );
  }
}
