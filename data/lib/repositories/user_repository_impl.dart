import 'package:data/entities/user/user_entities.dart';
import 'package:data/providers/api_provider.dart';
import 'package:domain/domain.dart' as domain;
import 'package:domain/domain.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiProvider _apiProvider;

  UserRepositoryImpl({
    required ApiProvider apiProvider,
  }) : _apiProvider = apiProvider;

  @override
  Future<domain.UserModel> getUserInformation({
    required GetUserInfoPayload payload,
  }) {
    return _apiProvider.getUserInformation(request: GetUserInfoRequest(id: payload.userId));
  }
}
