part of user_entities;

@JsonSerializable()
class UserEntity extends JsonSerializable {
  final int id;
  final String firstName;
  final String lastName;
  final String department;
  final double hourVolunteered;

  final String? profileImageUrl;
  final int? volunteerActivities;

  UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.hourVolunteered,
    this.profileImageUrl,
    this.volunteerActivities,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return _$UserEntityFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
