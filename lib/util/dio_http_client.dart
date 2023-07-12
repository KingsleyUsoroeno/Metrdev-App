import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:injectable/injectable.dart';
import 'package:metrdev_app/exceptions/exceptions.dart';

typedef HttpLibraryMethod<T> = Future<Response<T>> Function();

class _DioService extends DioForNative {
  _DioService() : super() {
    options = BaseOptions(
      baseUrl: "http://vbatest.metrdev.com:2472/api/v1/",
      connectTimeout: 60000,
      receiveTimeout: 60000,
      contentType: "application/json",
    );
  }
}

@singleton
class DioHttpClient {
  late final Dio _client;

  DioHttpClient() {
    _client = _DioService();
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _mapException(
      () => _client.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _mapException(
      () => _client.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  Future<Response<T>> _mapException<T>(HttpLibraryMethod<T> method) async {
    try {
      return await method();
    } on DioError catch (exception) {
      switch (exception.type) {
        case DioErrorType.cancel:
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          throw ConnectionException(exception.type);
        case DioErrorType.response:
          final response = exception.response;
          int statusCode = response?.statusCode ?? 0;
          if (response == null || response is! Response<T>) {
            throw UnknownError(exception, StackTrace.current);
          }
          switch (statusCode) {
            case 400:
            case 401:
            case 403:
            case 404:
            case 409:
            case 429:
            case 406:
            case 422:
              throw ClientSideError(
                errorCode: response.statusCode,
                data: response.data,
              );
          }
          throw ServerSideError(
            errorCode: response.statusCode,
            data: response.data,
          );
        default:
          if (exception.error is ServerSideError ||
              exception.error is HandshakeException ||
              exception.error is SocketException ||
              exception.error is TimeoutException) {
            throw ConnectionException(exception.type);
          } else {
            throw UnknownError(exception, StackTrace.current);
          }
      }
    } catch (exception, stackTrace) {
      throw UnknownError(exception, stackTrace);
    }
  }
}
