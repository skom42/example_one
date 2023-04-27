part of mappers;

class EventMapper implements Mapper<EventEntity, domain.EventModel> {
  const EventMapper();

  @override
  domain.EventModel fromEntity(EventEntity entity) {
    return domain.EventModel(
      id: entity.id,
      title: entity.title,
    );
  }

  @override
  EventEntity toEntity(domain.EventModel item) {
    return EventEntity(
      id: item.id,
      title: item.title,
    );
  }
}
