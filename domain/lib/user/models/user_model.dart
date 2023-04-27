part of user;

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String department;
  final double hourVolunteered;

  final String? profileImageUrl;
  final int? volunteerActivities;

  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.hourVolunteered,
    this.profileImageUrl,
    this.volunteerActivities,
  });
}
