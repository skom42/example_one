import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:create_report/create_report.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';
import 'package:user_profile/src/bloc/user_profile_event.dart';
import 'package:user_profile/src/bloc/user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final bool _isReroute;
  final UserModel _userModel;
  final AppRouterDelegate _appRouter;
  final CreateReportUseCase _createReportUseCase;

  UserProfileBloc({
    required bool isReroute,
    required UserModel userModel,
    required AppRouterDelegate appRouter,
    required CreateReportUseCase createReportUseCase,
  })  : _appRouter = appRouter,
        _isReroute = isReroute,
        _userModel = userModel,
        _createReportUseCase = createReportUseCase,
        super(UserProfileLoadingState()) {
    on<UserProfileInitializeEvent>(_onLoadDataEvent);
    add(UserProfileInitializeEvent(isReroute: _isReroute));
  }

  Future<void> _onLoadDataEvent(
    UserProfileInitializeEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(
      UserProfileContentState(userModel: _userModel),
    );
    if (event.isReroute) {
      final CreateReportPayload? result = await _appRouter.pushForResult(
        CreateReportFeature.page(),
      );

      if (result != null) {
        try {
          await _createReportUseCase.execute(result);
          _appRouter.push(
            SuccessFeature.page(),
          );
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
