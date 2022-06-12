
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpManager {
  HttpManager._privateConstructor();

  static final HttpManager _instance = HttpManager._privateConstructor();

  factory HttpManager() {
    return _instance;
  }

  getMethodCall(String url,Map<String,dynamic> queryParams)  async
  {
    var dio = Dio();
    var responseData;
    try {
      final response = await dio.get(url,queryParameters: queryParams);
      responseData  = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Please check for Internet connection');
    }
    return responseData;
  }

  postMethodCall(String url,Map<String,dynamic> postParams)  async
  {
    print("$postParams");
    var dio = Dio();
    // ignore: prefer_typing_uninitialized_variables
    var responseData;
    try {
      final response = await dio.post(url,data: postParams);
      responseData  = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Please check for Internet connection');
    }
    return responseData;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson =  response.data;
        debugPrint("response $responseJson");
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 429:
        throw UnauthorisedException("Please try again later");
      case 500:
      default:
        throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

}


class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "Error: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}