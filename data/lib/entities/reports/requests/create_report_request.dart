part of report_entity;

@JsonSerializable(createFactory: false)
class CreateReportRequest {
  final String title;
  final String initiatorTitle;
  final String startTime;
  final String endTime;
  final String userId;

  CreateReportRequest({
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.initiatorTitle,
    required this.userId,
  });

  @override
  Map<String, dynamic> toJson() => _$CreateReportRequestToJson(this);
}
