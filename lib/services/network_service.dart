import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkService {
  static var logger = Logger();

  static String BASE = "213.230.110.134:8088";
  static String accessToken = "";

  static Map<String, String> bearerHeader = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };
  static Map<String, String> authHeader = {
    'Content-Type': 'application/json',
  };

  ///APIs
  static String API_AUTH = "/api/auth/authenticate";
  static String API_SEND_TEXT = "/api/avto/sendText";
  static String API_GET_CAR_DATA = "/api/avto/getCarData";
  static String API_SEND_PINFL = "/api/avto/sendPinfll";
  static String API_GET_PINFL = "/api/avto/getPinfl";
  static String API_GET_FULL_INFO = "/api/avto/getPinflFullInfo";

  /// request methods
  static Future<Map<String, dynamic>?> GET(
      String api, Map<String, dynamic> params) async {
    var uri = Uri.http(BASE, api, params);
    Map<String, dynamic> responseMap = {};
    Response response = await get(uri, headers: bearerHeader);
    if (response.statusCode == 200 || response.statusCode == 201) {
      responseMap.addAll({
        "statusCode": response.statusCode,
        "responseBody": jsonDecode(response.body)
      });

      logger.i("Get request statuscode ${response.statusCode}");
      return responseMap;
    } else {

      print("Mana o'sha: ${response.statusCode}");
    }
    return null;
  }

  /// quyidagi get methodi send pinfl api uchun
  static Future<int?> GETSENDPINF(
      String api, Map<String, dynamic> params) async {
    var uri = Uri.http(BASE, api, params);
    Response response = await get(uri, headers: bearerHeader);
    if (response.statusCode == 200 || response.statusCode == 201) {
      logger.i("GETSENDPINF status code ${response.statusCode}");
      return response.statusCode;
    } else {
      print("Mana o'sha: ${response.statusCode}");
    }
    return null;
  }

  static Future<Map<String, dynamic>> POST(
      String api, Map<String, dynamic> params) async {
    var uri = Uri.http(BASE, api);
    Map<String, dynamic> responseMap = {};
    try {
      Response response =
          await post(uri, headers: authHeader, body: jsonEncode(params));

      Map<String, dynamic> mp = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 230) {
        responseMap
            .addAll({"statusCode": response.statusCode, "responseBody": mp});
      } else if (response.statusCode >= 400 && response.statusCode < 455) {
        responseMap
            .addAll({"statusCode": response.statusCode, "responseBody": mp});
        logger.e(
            "Client error in POST method, status code: ${response.statusCode}");
      } else if (response.statusCode >= 500 && response.statusCode < 520) {
        responseMap
            .addAll({"statusCode": response.statusCode, "responseBody": mp});
        logger.e(
            "Server error in POST method, status code: ${response.statusCode}");
      } else {
        responseMap
            .addAll({"statusCode": response.statusCode, "responseBody": mp});
        logger.e(
            "Unexpected error in POST method, status code: ${response.statusCode}");
      }
    } catch (e) {
      logger.e("POST request error: $e");
    }
    return responseMap;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);
    Response response =
        await put(uri, headers: bearerHeader, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    Response response = await delete(uri, headers: bearerHeader);
    return null;
  }

  static Map<String, dynamic> paramsEmpty() {
    Map<String, dynamic> params = {};
    return params;
  }

// static parsingResponse(String response) {
//   dynamic json = jsonDecode(response);
//   List<Employee> employees = List<Employee>.from(
//       json['data'].map((employee) => Employee.fromJson(employee)));
//   logger.i(employees.runtimeType);
//   return employees;
// }
}
