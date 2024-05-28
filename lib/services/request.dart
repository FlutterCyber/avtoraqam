import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> authenticate(
    {required String username,
    required String password,
    required String phoneModel}) async {
  // Define the base URL and API endpoint
  String baseUrl = "213.230.110.134:8088";
  String apiAuth = "/api/auth/authenticate";
  String url = "http://$baseUrl$apiAuth";

  // Define the request body
  Map<String, String> requestBody = {
    'username': username,
    'password': password,
    'phoneModel': phoneModel,
  };

  // Encode the request body to JSON
  String jsonBody = jsonEncode(requestBody);

  // Make the HTTP POST request
  http.Response response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      // Set the content type to application/json
    },
    body: jsonBody,
  );

  // Check the response status code and handle accordingly
  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    print('Response data: ${response.body}');
  } else {
    // If the server returns an error response, handle it
    print('Request failed with status: ${response.statusCode}');
  }
}
