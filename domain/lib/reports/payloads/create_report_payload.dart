part of reports_library;

class CreateReportPayload {
  final DateTime date;
  final DateTime endTime;
  final DateTime startTime;
  final String activityTitle;

  CreateReportPayload({
    required this.date,
    required this.endTime,
    required this.startTime,
    required this.activityTitle,
  });
}
