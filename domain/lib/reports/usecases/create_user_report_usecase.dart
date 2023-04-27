part of reports_library;

class CreateReportUseCase implements FutureUseCase<void, CreateReportPayload> {
  final ReportsRepository _reportRepository;

  const CreateReportUseCase({
    required ReportsRepository reportRepository,
  }) : _reportRepository = reportRepository;

  @override
  Future<void> execute(CreateReportPayload createReportModel) async {
    return _reportRepository.createUserReport(payload: createReportModel);
  }
}
