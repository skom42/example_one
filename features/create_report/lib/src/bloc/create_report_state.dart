import 'package:domain/domain.dart';

abstract class CreateReportState {}

class CreateReportLoading extends CreateReportState {}

class CreateReportContent extends CreateReportState {
  final bool isValidationsPassed;
  final List<EventModel> activities;
  DateTime? selectedDate;
  DateTime? selectedEndTime;
  DateTime? selectedStartTime;
  EventModel? selectedActivity;

  CreateReportContent({
    required this.activities,
    required this.isValidationsPassed,
    this.selectedDate,
    this.selectedEndTime,
    this.selectedActivity,
    this.selectedStartTime,
  });
}

class CreateReportErrorState extends CreateReportState {}
