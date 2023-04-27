abstract class DashboardEvent {
  const DashboardEvent();
}

class LoadDataEvent extends DashboardEvent {
  const LoadDataEvent();
}

class CreateUserTimeReportEvent extends DashboardEvent {
  const CreateUserTimeReportEvent();
}

class DeleteUserTimeReportEvent extends DashboardEvent {
  final int id;

  const DeleteUserTimeReportEvent({
    required this.id,
  });
}

class RouteToUserProfileEvent extends DashboardEvent {
  const RouteToUserProfileEvent();
}
