import 'package:core/core.dart';
import 'package:create_report/src/bloc/create_report_event.dart';
import 'package:create_report/src/bloc/create_report_state.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:navigation/navigation.dart';

class CreateReportBloc extends Bloc<CreateReportEvent, CreateReportState> {
  final AppRouterDelegate _appRouter;
  final GetEventsUseCase _getEventsUseCase;

  DateTime? selectedDate;
  DateTime? selectedEndTime;
  DateTime? selectedStartTime;
  EventModel? selectedActivity;

  List<EventModel> activities = <EventModel>[];

  CreateReportBloc({
    required AppRouterDelegate appRouter,
    required GetEventsUseCase getEventsUseCase,
  })  : _appRouter = appRouter,
        _getEventsUseCase = getEventsUseCase,
        super(CreateReportLoading()) {
    on<CreateReportLoadData>(_onCreateReportLoadData);
    on<CreateReportUploadDataEvent>(_onCreateReportUploadDataEvent);
    on<ValidateDateEvent>(_onValidateDateEvent);
    add(CreateReportLoadData());
  }

  CreateReportContent get _contentState => CreateReportContent(
        activities: activities,
        selectedDate: selectedDate,
        selectedEndTime: selectedEndTime,
        selectedStartTime: selectedStartTime,
        selectedActivity: selectedActivity,
        isValidationsPassed: _checkIsValidationsPassed(),
      );

  Future<void> _onCreateReportLoadData(
    CreateReportLoadData event,
    Emitter<CreateReportState> emit,
  ) async {
    try {
      activities = await _getEventsUseCase.execute(NoParams());

      emit(_contentState);
    } catch (e) {
      emit(CreateReportErrorState());
    }
  }

  Future<void> _onCreateReportUploadDataEvent(
    CreateReportUploadDataEvent event,
    Emitter<CreateReportState> emit,
  ) async {
    //_createReportUseCase
    const Duration autoPopDuration = Duration(milliseconds: 140);
    await Future.delayed(
      autoPopDuration,
      () => _appRouter.popWithResult(CreateReportPayload(
        date: selectedDate!,
        activityTitle: selectedActivity!.title,
        startTime: selectedStartTime!,
        endTime: selectedEndTime!,
      )),
    );
  }

  Future<void> _onValidateDateEvent(
    ValidateDateEvent event,
    Emitter<CreateReportState> emit,
  ) async {
    selectedActivity = event.activityModel;
    selectedDate = event.date;
    selectedEndTime = event.endTime;
    selectedStartTime = event.startTime;

    emit(
      _contentState,
    );
  }

  bool _checkIsValidationsPassed() {
    return selectedDate != null &&
        selectedEndTime != null &&
        selectedStartTime != null &&
        selectedActivity != null;
  }
}
