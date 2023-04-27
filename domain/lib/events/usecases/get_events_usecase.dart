part of event_library;

class GetEventsUseCase extends FutureUseCase<List<EventModel>, NoParams> {
  final EventRepository _reportsRepository;

  GetEventsUseCase({
    required EventRepository eventRepository,
  }) : _reportsRepository = eventRepository;

  @override
  Future<List<EventModel>> execute(NoParams noParams) async {
    return _reportsRepository.getAllEvents();
  }
}
