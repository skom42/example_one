part of reports_library;

class DeleteCustomerReportUseCase implements FutureUseCase<void, int> {
  final ReportsRepository _reportRepository;

  const DeleteCustomerReportUseCase({
    required ReportsRepository reportRepository,
  }) : _reportRepository = reportRepository;

  @override
  Future<void> execute(int id) async {
    return _reportRepository.deleteUserReport(id: id);
  }
}
