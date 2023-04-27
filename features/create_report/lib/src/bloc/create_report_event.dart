import 'package:domain/domain.dart';

abstract class CreateReportEvent {}

class CreateReportLoadData extends CreateReportEvent {}

class CreateReportUploadDataEvent extends CreateReportEvent {}

class ValidateDateEvent extends CreateReportEvent {
  final DateTime? date;
  final DateTime? endTime;
  final DateTime? startTime;
  final EventModel? activityModel;

  ValidateDateEvent({
    this.date,
    required this.endTime,
    required this.startTime,
    required this.activityModel,
  });
}
