import 'package:data/providers/api_provider.dart';
import 'package:domain/domain.dart' as domain;
import 'package:domain/domain.dart';

class EventRepositoryImpl implements EventRepository {
  final ApiProvider _apiProvider;

  EventRepositoryImpl({
    required ApiProvider apiProvider,
  }) : _apiProvider = apiProvider;

  @override
  Future<List<domain.EventModel>> getAllEvents() {
    return _apiProvider.getAllEvents();
  }
}
