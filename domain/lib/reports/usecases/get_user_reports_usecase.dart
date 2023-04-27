part of reports_library;

class GetUserReportsUsecase extends FutureUseCase<List<UserReport>, NoParams> {
  final ReportsRepository _reportsRepository;

  GetUserReportsUsecase({
    required ReportsRepository reportsRepository,
  }) : _reportsRepository = reportsRepository;

  @override
  Future<List<UserReport>> execute(NoParams noParams) async {
    return _reportsRepository.getUserReports();
  }
}
