import 'package:domain/domain.dart';

abstract class UserProfileState {}

class UserProfileLoadingState extends UserProfileState {}

class UserProfileContentState extends UserProfileState {
  final UserModel userModel;

  UserProfileContentState({
    required this.userModel,
  });
}
