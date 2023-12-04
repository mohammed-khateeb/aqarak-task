import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Model/Response/request_response.dart';

class ApiServices {
  Future<Dio> launchDio() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    dio.options.headers['Content-Type'] = 'application/json';

    dio.options.headers['accept'] = 'application/json';
    dio.options.headers['sharedKey'] =
        'Ftjj#-ddtrum5261_gfRdCXooO#165?*234sEEd';
    dio.options.followRedirects = false;
    dio.options.validateStatus = (s) {
      if (s != null) {
        return s < 500;
      } else {
        return false;
      }
    };
    return dio;
  }

  get({required String url, params}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio.get(url, queryParameters: params);

      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Connection Failed');
      } else {
        return RequestResponse(false, error: 'Network Error');
      }
    } catch (e) {
      if (e is DioException) {
        if (e.message!.contains("SocketException")) {
          return RequestResponse(false, error: 'Connection Failed');
        } else {
          return RequestResponse(false, error: 'Connection Failed');
        }
      } else {
        return RequestResponse(false, error: 'Connection Failed');
      }
    }
  }
}
