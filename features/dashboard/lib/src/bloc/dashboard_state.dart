import 'package:domain/domain.dart';

abstract class DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardContentState extends DashboardState {
  final UserModel userModel;
  final List<UserReport> userReports;

  DashboardContentState({
    required this.userModel,
    required this.userReports,
  });
}

class ErrorState extends DashboardState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
