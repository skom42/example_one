part of event_library;

abstract class EventRepository {
  Future<List<EventModel>> getAllEvents();
}
