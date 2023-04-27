import 'package:core/core.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  Future<Never> handleError(DioError error) async {
    final Response<dynamic>? response = error.response;
    if (!await InternetConnectionService.isConnected) {
      throw NoInternetConnection();
    } else if (response == null) {
      throw BackendException();
    } else {
      final int? statusCode = response.statusCode;
      if (statusCode != null) {
        if (statusCode == 400) {
          //TODO: Add error parsing logic here
          throw AppException('');
        }

        if (statusCode == 401) {
          throw Exception(error.toString());
        }

        if (statusCode >= 500) {
          throw BackendException();
        }
      }

      throw Exception(error.toString());
    }
  }
}
