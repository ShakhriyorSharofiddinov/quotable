import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../core/app_exception.dart';
import 'base_service.dart';

class ListQuoteService extends BaseService {

  @override
  Future getResponse(String url) async {
    dynamic responseJson;

    try {
      final String requestUrl = baseUrl + url;
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception("Internet error");
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 401:
        throw UnauthorizedException(response.statusCode.toString());
      case 404:
        throw FetchDataException('404 NOT FOUND');
      default:
        throw FetchDataException('Error while communication');
    }
  }
}
