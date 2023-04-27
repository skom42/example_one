part of reports_library;

class UserReport {
  final int id;
  final int endTime;
  final String title;
  final int startTime;
  final DateTime creationDate;
  final String initiatorTitle;

  UserReport({
    required this.id,
    required this.title,
    required this.endTime,
    required this.startTime,
    required this.creationDate,
    required this.initiatorTitle,
  });
}
