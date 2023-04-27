import 'package:data/errors/error_handler.dart';
import 'package:dio/dio.dart';

import '../queries/api_query.dart';

class ApiProviderBase {
  final String _baseUrl;
  final ErrorHandler _errorHandler;

  final Dio _dio = Dio();

  ApiProviderBase({
    required String baseUrl,
    required ErrorHandler errorHandler,
  })  : _baseUrl = baseUrl,
        _errorHandler = errorHandler {
    _setupDio(
      dio: _dio,
      baseUrl: baseUrl,
    );
  }

  Future<T> get<T>(
    Function? parse,
    ApiQuery query,
  ) async {
    return safeRequest(() async {
      final Response response = await _dio.get(
        query.endpointPostfix,
        queryParameters: query.params,
      );

      return parse != null ? parse(response.data!) : response.data!;
    });
  }

  Future<T> post<T>(
    Function? parse,
    ApiQuery query, {
    bool isFormData = false,
  }) async {
    return safeRequest(() async {
      final Response response = await _dio.post(
        query.endpointPostfix,
        data: isFormData ? query.formDataBody : query.jsonEncodedBody,
        queryParameters: query.params,
      );

      if (parse != null) {
        return parse(response.data!);
      }
      return response.data!;
    });
  }

  Future<void> put(ApiQuery query) async {
    return safeRequest(() async {
      await _dio.put(
        query.endpointPostfix,
        data: query.body,
        queryParameters: query.params,
      );
    });
  }

  Future<void> patch(ApiQuery query) async {
    return safeRequest(() async {
      await _dio.patch(
        query.endpointPostfix,
        data: query.body,
        queryParameters: query.params,
      );
    });
  }

  Future<void> delete(ApiQuery query) async {
    return safeRequest(() async {
      await _dio.delete(
        query.endpointPostfix,
        data: query.body,
        queryParameters: query.params,
      );
    });
  }

  Future<T> safeRequest<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on DioError catch (e) {
      print(e);
      return _errorHandler.handleError(e);
    }
  }

  void _setupDio({
    required Dio dio,
    required String baseUrl,
  }) {
    dio.options.baseUrl = baseUrl;
  }
}
