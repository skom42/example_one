import 'package:core/core.dart';
import 'package:data/providers/api_provider_base.dart';
import 'package:domain/domain.dart' as domain;

import '../entities/entities.dart';
import '../mappers/mappers.dart';
import '../queries/api_query.dart';

class ApiProvider {
  final MapperFactory _mapper;
  final ApiProviderBase _apiProviderBase;

  ApiProvider({
    required MapperFactory mapper,
    required ApiProviderBase apiProviderBase,
  })  : _mapper = mapper,
        _apiProviderBase = apiProviderBase;

  Future<domain.UserModel> getUserInformation({
    required GetUserInfoRequest request,
  }) async {
    return _apiProviderBase
        .get<UserEntity>(
          UserEntity.fromJson,
          ApiQuery(
            params: null,
            body: null,
            endpointPostfix: '${ApiConstants.userInformation}${request.id}',
          ),
        )
        .then(_mapper.userMapper.fromEntity);
  }

  Future<List<domain.EventModel>> getAllEvents() async {
    final List<dynamic> response = await _apiProviderBase.get(
      null,
      ApiQuery(
        body: null,
        params: null,
        endpointPostfix: ApiConstants.userAllEventsUrl,
      ),
    );

    final List<EventEntity> convertedResponse =
        response.map((e) => EventEntity.fromJson(e as Map<String, dynamic>)).toList();

    return _mapper.eventMapper.fromList(convertedResponse);
  }

  Future<List<domain.UserReport>> getUserTimeReports() async {
    final List<dynamic> response = await _apiProviderBase.get(
      null,
      ApiQuery(
        body: null,
        params: null,
        endpointPostfix: '${ApiConstants.userTimeReportsUrl}1',
      ),
    ) as List<dynamic>;

    final List<ReportEntity> convertedResponse =
        response.map((e) => ReportEntity.fromJson(e as Map<String, dynamic>)).toList();

    return _mapper.reportMapper.fromList(convertedResponse);
  }

  Future<void> createReport({
    required CreateReportRequest request,
  }) async {
    return _apiProviderBase.post<void>(
      null,
      ApiQuery(
        params: null,
        body: request.toJson(),
        endpointPostfix: ApiConstants.userDeleteReportUrl,
      ),
    );
  }

  Future<void> deleteCustomerReport({required int id}) async {
    return await _apiProviderBase.delete(
      ApiQuery(
        body: null,
        params: null,
        endpointPostfix: '${ApiConstants.userDeleteReportUrl}${id.toString()}',
      ),
    );
  }
}
