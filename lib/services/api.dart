import 'custom_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  //Base URL input
  final String _baseUrl = 'https://api.spacexdata.com/v3/launches/';
  //Set Header of http request
  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };
  // create get request function
  Future<dynamic> get(String url) async {
    var responseJson;
    var fullUrl = _baseUrl + url;
    try {
      final response = await http.get(
        fullUrl,
        headers: _setHeaders(),
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
  //fetch any exception
  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 422:
        throw InvalidInputException(response.body.toString());
      default:
        throw FetchDataException(response.body.toString()+'error code : '+response.statusCode.toString());
    }
  }

}
