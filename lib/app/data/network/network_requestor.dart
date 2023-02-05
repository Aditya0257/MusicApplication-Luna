import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../utils/error_handler/exception_handler.dart';



class NetworkRequester {
  late Dio _dio;

  NetworkRequester._privateConstructor() {
    prepareRequest();
  }

  static final NetworkRequester shared = NetworkRequester._privateConstructor();

  void prepareRequest() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      baseUrl: 'https://api.spotify.com/v1',
      contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json,
      headers: {
        'Accept': Headers.jsonContentType,
        'Authorization': 
            'Bearer BQC5AizbPr7x6yEdkEoA2SkXvX7c6BxdO9oP7XPS1urmH38Uawcrp--VaLsPBtErDLHolvNiK1MBJjHLBWQLpTTKYVKNGrxXWC5wPy3qsXq_nMFo8s24YyUb6llI0TqzpD2yf_F224hucDtA9jXzBK04sj2CEObmQHKCX781cafIUNvI_0eeU2mHmWCuHRdMl-8'
            ,
      },
    );
    

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    _dio.interceptors.addAll([
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: _printLog,
      )
    ]);
  }

  _printLog(Object object) => log(object.toString());

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: query);
      return response.data;
    } on Exception catch (exception) {
      return ExceptionHandler.handleError(exception);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(
        path,
        queryParameters: query,
        data: data,
      );
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.put(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
      await _dio.patch(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
      await _dio.delete(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }
}