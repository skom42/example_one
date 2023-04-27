part of event_entity;

@JsonSerializable()
class EventEntity extends JsonSerializable {
  final int id;
  final String title;

  const EventEntity({
    required this.id,
    required this.title,
  });

  factory EventEntity.fromJson(Map<String, dynamic> json) {
    return _$EventEntityFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$EventEntityToJson(this);
}
