import 'dart:async';

import 'package:core/utils/date_time_utils.dart';
import 'package:data/entities/entities.dart';
import 'package:domain/reports/reports_library.dart';

import '../providers/api_provider.dart';

class ReportsRepositoryImpl implements ReportsRepository {
  final ApiProvider _apiProvider;

  late StreamController<bool> _dropNotificationStreamController;

  ReportsRepositoryImpl({
    required ApiProvider apiProvider,
  }) : _apiProvider = apiProvider {
    _dropNotificationStreamController = StreamController<bool>.broadcast();
  }

  @override
  Future<List<UserReport>> getUserReports() {
    return _apiProvider.getUserTimeReports();
  }

  @override
  Future<void> createUserReport({required CreateReportPayload payload}) async {
    _apiProvider.createReport(
      request: CreateReportRequest(
        userId: '1',
        title: payload.activityTitle,
        initiatorTitle: 'JustHardcodedName',
        startTime: DateTimeUtils.getTimeStampFromTime(
          date: payload.date,
          time: payload.startTime,
        ),
        endTime: DateTimeUtils.getTimeStampFromTime(
          date: payload.date,
          time: payload.endTime,
        ),
      ),
    );
    _dropNotificationStreamController.add(true);
  }

  @override
  Future<void> deleteUserReport({required int id}) {
    return _apiProvider.deleteCustomerReport(id: id);
  }

  @override
  Stream<bool> observeReportsAdding() => _dropNotificationStreamController.stream;
}
