part of reports_library;

class ObserveReportsAddedUsecase extends StreamUseCase<bool, NoParams> {
  final ReportsRepository _reportRepository;

  ObserveReportsAddedUsecase({
    required ReportsRepository reportRepository,
  }) : _reportRepository = reportRepository;

  @override
  Stream<bool> execute(NoParams params) {
    return _reportRepository.observeReportsAdding();
  }
}
