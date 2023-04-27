// GENERATED CODE - DO NOT MODIFY BY HAND

part of event_entity;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventEntity _$EventEntityFromJson(Map<String, dynamic> json) => EventEntity(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$EventEntityToJson(EventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
