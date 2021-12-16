import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:urlshortner/app/routes/api.routes.dart';

class ShortnerNetwork {
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*"
  };

  Future<dynamic> customUrl(
      {required String destination, required String customText}) async {
    final Uri uri = Uri.parse(ApiRoutes.baseurl + "/custom");
    final http.Response response = await client.post(
      uri,
      headers: headers,
      body: jsonEncode(
        {
          "customText": customText,
          "destination": destination,
        },
      ),
    );
    final body = response.body;
    return body;
  }

  Future<dynamic> randomUrl({
    required String destination,
  }) async {
    final Uri uri = Uri.parse(ApiRoutes.baseurl + "/random");
    final http.Response response = await client.post(
      uri,
      headers: headers,
      body: jsonEncode(
        {
          "destination": destination,
        },
      ),
    );
    final body = response.body;
    return body;
  }
}
