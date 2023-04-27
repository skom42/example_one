part of user;

class GetUserInformationUseCase extends FutureUseCase<UserModel, GetUserInfoPayload> {
  final UserRepository _userRepository;

  GetUserInformationUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<UserModel> execute(GetUserInfoPayload params) async {
    return _userRepository.getUserInformation(payload: params);
  }
}
