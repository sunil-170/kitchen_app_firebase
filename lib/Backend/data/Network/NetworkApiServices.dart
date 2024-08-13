import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kitchen_app/Backend/data/Network/BaseApiServices.dart';

class NetworkApiSerices extends BaseApiServices {}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responsejson = jsonDecode(response.body);
      return responsejson;

    default:
      throw "Error accured while communicating with  server " +
          "with statuscode " +
          response.statusCode.toString();
  }
}
