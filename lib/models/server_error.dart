import 'dart:convert';

import 'package:dio/dio.dart' hide Headers;

class ServerError implements Exception {
  late int _errorCode;
  late String _errorMessage;

  ServerError.withError({required Object error}) {
    _handleError(error);
  }

  String get errorMessage => _errorMessage;
  int get errorCode => _errorCode;

  _handleError(Object error) {
    if (error is DioError) {
      _errorCode = error.response!.statusCode!;

      switch (error.type) {
        case DioErrorType.cancel:
          _errorMessage = "Request was cancelled";
          break;
        case DioErrorType.connectionTimeout:
          _errorMessage = "Connection timeout";
          break;
        case DioErrorType.unknown:
          _errorMessage = "Unexpected value returned from API";
          break;
        case DioErrorType.receiveTimeout:
          _errorMessage = "Receive timeout in connection";
          break;
        case DioErrorType.badResponse:
          // _errorMessage = _handleMessage(
          //   error.response!.statusCode!,
          //   error.response!.data!,
          // );
          final body = json.decode(error.response.toString());
          print("error response $body");
          //_errorMessage = body.message ?? "Something went wrong";
          _errorMessage = body['message'] ?? "Something went wrong";
          print("getting error message $_errorMessage");

          // if (errors.message != null) {
          //   _errorMessage = errors.message!;
          // }
          //"Error occured"; if error is jsonbody then manpulate it to the object
          //"Received invalid status code: ${error.response.statusCode} ${body['error_description']}";
          break;
        case DioErrorType.sendTimeout:
          _errorMessage = "Receive timeout in send request";
          break;
        case DioErrorType.badCertificate:
          _errorMessage = 'Invalid certificate';
          break;
        case DioErrorType.connectionError:
          _errorMessage = 'Unable to connect';
          break;
        default:
          _errorMessage = 'Something went wrong';
      }
    }
    return _errorMessage;
  }

  String _handleMessage(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => _errorMessage;
}
