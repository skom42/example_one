part of mappers;

class UserMapper implements Mapper<UserEntity, domain.UserModel> {
  const UserMapper();

  @override
  domain.UserModel fromEntity(UserEntity entity) {
    return domain.UserModel(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
      department: entity.department,
      hourVolunteered: entity.hourVolunteered,
      profileImageUrl: entity.profileImageUrl,
      volunteerActivities: entity.volunteerActivities,
    );
  }

  @override
  UserEntity toEntity(domain.UserModel item) {
    return UserEntity(
      id: item.id,
      firstName: item.firstName,
      lastName: item.lastName,
      department: item.department,
      hourVolunteered: item.hourVolunteered,
      profileImageUrl: item.profileImageUrl,
      volunteerActivities: item.volunteerActivities,
    );
  }
}
