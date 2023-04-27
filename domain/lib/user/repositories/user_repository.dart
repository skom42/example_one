part of user;

abstract class UserRepository {
  Future<UserModel> getUserInformation({required GetUserInfoPayload payload});
}
