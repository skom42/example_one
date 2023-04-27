// GENERATED CODE - DO NOT MODIFY BY HAND

part of report_entity;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportEntity _$ReportEntityFromJson(Map<String, dynamic> json) => ReportEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      endTime: json['endTime'] as int,
      startTime: json['startTime'] as int,
      creationDate: DateTime.parse(json['creationDate'] as String),
      initiatorTitle: json['initiatorTitle'] as String,
    );

Map<String, dynamic> _$ReportEntityToJson(ReportEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'endTime': instance.endTime,
      'startTime': instance.startTime,
      'creationDate': instance.creationDate.toIso8601String(),
      'initiatorTitle': instance.initiatorTitle,
    };

Map<String, dynamic> _$CreateReportRequestToJson(
        CreateReportRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'initiatorTitle': instance.initiatorTitle,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'userId': instance.userId,
    };
