part of report_entity;

@JsonSerializable()
class ReportEntity extends JsonSerializable {
  final int id;
  final String title;
  final int endTime;
  final int startTime;
  final DateTime creationDate;
  final String initiatorTitle;

  const ReportEntity({
    required this.id,
    required this.title,
    required this.endTime,
    required this.startTime,
    required this.creationDate,
    required this.initiatorTitle,
  });

  factory ReportEntity.fromJson(Map<String, dynamic> json) {
    return _$ReportEntityFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$ReportEntityToJson(this);
}
