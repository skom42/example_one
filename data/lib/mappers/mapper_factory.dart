part of mappers;

class MapperFactory {
  UserMapper get userMapper => const UserMapper();

  EventMapper get eventMapper => const EventMapper();

  ReportMapper get reportMapper => const ReportMapper();
}
