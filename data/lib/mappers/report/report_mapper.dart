part of mappers;

class ReportMapper implements Mapper<ReportEntity, domain.UserReport> {
  const ReportMapper();

  @override
  domain.UserReport fromEntity(ReportEntity entity) {
    return domain.UserReport(
      id: entity.id,
      title: entity.title,
      endTime: entity.endTime,
      startTime: entity.startTime,
      creationDate: entity.creationDate,
      initiatorTitle: entity.initiatorTitle,
    );
  }

  @override
  ReportEntity toEntity(domain.UserReport item) {
    return ReportEntity(
      id: item.id,
      title: item.title,
      endTime: item.endTime,
      startTime: item.startTime,
      creationDate: item.creationDate,
      initiatorTitle: item.initiatorTitle,
    );
  }
}
