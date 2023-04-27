import 'package:core/core.dart';
import 'package:data/errors/error_handler.dart';
import 'package:data/mappers/mappers.dart';
import 'package:data/providers/api_provider.dart';
import 'package:data/providers/api_provider_base.dart';
import 'package:data/repositories/reports_repository_impl.dart';
import 'package:data/repositories/user_repository_impl.dart';
import 'package:data/repositories/event_repository_impl.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    appLocator.registerLazySingleton<ErrorHandler>(
      ErrorHandler.new,
    );

    appLocator.registerLazySingleton<ApiProviderBase>(
      () => ApiProviderBase(
        baseUrl: ApiConstants.devBaseUrl,
        errorHandler: appLocator.get<ErrorHandler>(),
      ),
    );

    appLocator.registerLazySingleton<ApiProvider>(
      () => ApiProvider(
        mapper: MapperFactory(),
        apiProviderBase: appLocator.get<ApiProviderBase>(),
      ),
    );

    appLocator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        apiProvider: appLocator.get<ApiProvider>(),
      ),
    );

    appLocator.registerLazySingleton<EventRepository>(
      () => EventRepositoryImpl(
        apiProvider: appLocator.get<ApiProvider>(),
      ),
    );

    appLocator.registerLazySingleton<ReportsRepository>(
      () => ReportsRepositoryImpl(
        apiProvider: appLocator.get<ApiProvider>(),
      ),
    );

    appLocator.registerLazySingleton<GetUserInformationUseCase>(
      () => GetUserInformationUseCase(
        userRepository: appLocator.get<UserRepository>(),
      ),
    );

    appLocator.registerLazySingleton<GetUserReportsUsecase>(
      () => GetUserReportsUsecase(
        reportsRepository: appLocator.get<ReportsRepository>(),
      ),
    );

    appLocator.registerLazySingleton<GetEventsUseCase>(
      () => GetEventsUseCase(
        eventRepository: appLocator.get<EventRepository>(),
      ),
    );

    appLocator.registerLazySingleton<CreateReportUseCase>(
      () => CreateReportUseCase(
        reportRepository: appLocator.get<ReportsRepository>(),
      ),
    );

    appLocator.registerLazySingleton<DeleteCustomerReportUseCase>(
      () => DeleteCustomerReportUseCase(
        reportRepository: appLocator.get<ReportsRepository>(),
      ),
    );

    appLocator.registerLazySingleton<ObserveReportsAddedUsecase>(
          () => ObserveReportsAddedUsecase(
        reportRepository: appLocator.get<ReportsRepository>(),
      ),
    );
  }
}
