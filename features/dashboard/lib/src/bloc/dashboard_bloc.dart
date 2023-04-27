import 'dart:async';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/bloc/dashboard_event.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:navigation/navigation.dart';
import 'package:user_profile/user_profile.dart';

import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final AppRouterDelegate _appRouter;
  final GetUserReportsUsecase _getUserReportsUsecase;
  final GetUserInformationUseCase _getUserInformationUseCase;
  final DeleteCustomerReportUseCase _deleteCustomerReportUseCase;
  final ObserveReportsAddedUsecase _observeReportsAddedUsecase;

  StreamSubscription<bool>? _dailyRemindersUpdatesSubscription;

  DashboardBloc({
    required AppRouterDelegate appRouter,
    required GetUserReportsUsecase getUserReportsUsecase,
    required GetUserInformationUseCase getUserInformationUseCase,
    required ObserveReportsAddedUsecase observeReportsAddedUsecase,
    required DeleteCustomerReportUseCase deleteCustomerReportUseCase,
  })  : _appRouter = appRouter,
        _getUserReportsUsecase = getUserReportsUsecase,
        _getUserInformationUseCase = getUserInformationUseCase,
        _observeReportsAddedUsecase = observeReportsAddedUsecase,
        _deleteCustomerReportUseCase = deleteCustomerReportUseCase,
        super(DashboardLoadingState()) {
    on<LoadDataEvent>(_onLoadDataEvent);
    on<RouteToUserProfileEvent>(_onRouteToUserProfileEvent);
    on<CreateUserTimeReportEvent>(_onCreateUserTimeReportEvent);
    on<DeleteUserTimeReportEvent>(_onDeleteUserTimeReportEvent);
    add(const LoadDataEvent());

    _dailyRemindersUpdatesSubscription ??=
        _observeReportsAddedUsecase.execute(NoParams()).listen((bool isDailyRemindersUpdated) {
      if (isDailyRemindersUpdated) {
        add(const LoadDataEvent());
      }
    });
  }

  UserModel? userModel;
  List<UserReport> userReports = <UserReport>[];

  Future<void> _onLoadDataEvent(
    LoadDataEvent event,
    Emitter<DashboardState> emit,
  ) async {
    try {
      userModel = await _getUserInformationUseCase.execute(
        const GetUserInfoPayload(userId: 1),
      );
      final List<UserReport> userReports = await _getUserReportsUsecase.execute(NoParams());

      if (userModel != null) {
        emit(
          DashboardContentState(
            userModel: userModel!,
            userReports: userReports,
          ),
        );
      }
    } catch (e) {
      emit(ErrorState(
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onRouteToUserProfileEvent(
    RouteToUserProfileEvent event,
    Emitter<DashboardState> emit,
  ) async {
    if (userModel != null) {
      _appRouter.push(
        UserProfileFeature.page(isReroute: false, userModel: userModel!),
      );
    }
  }

  Future<void> _onCreateUserTimeReportEvent(
    CreateUserTimeReportEvent event,
    Emitter<DashboardState> emit,
  ) async {
    if (userModel != null) {
      _appRouter.push(
        UserProfileFeature.page(isReroute: true, userModel: userModel!),
      );
    }
  }

  Future<void> _onDeleteUserTimeReportEvent(
    DeleteUserTimeReportEvent event,
    Emitter<DashboardState> emit,
  ) async {
    final bool? result = await _appRouter.pushForResult(
      DeleteConfirmation.page(),
    );

    if (result != null && result) {
      try {
        await _deleteCustomerReportUseCase.execute(event.id);
        add(const LoadDataEvent());
      } catch (e) {
        emit(ErrorState(
          errorMessage: e.toString(),
        ));
      }
    }
  }
}
