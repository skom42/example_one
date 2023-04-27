part of reports_library;

abstract class ReportsRepository {
  Future<List<UserReport>> getUserReports();

  Future<void> createUserReport({required CreateReportPayload payload});

  Future<void> deleteUserReport({required int id});

  Stream<bool> observeReportsAdding();
}
