import 'dart:convert';

import 'package:meta/meta.dart';

import 'package:http/http.dart';
import '../../data/http/http.dart';

class HttpAdapter implements HttpClient {
  Client client;

  HttpAdapter(this.client);

  Future<Map> request({@required String url, @required String method, Map body}) async {
    final headers = {'content-type': 'application/json', 'accept': 'application/json'};
    final jsonBody = body != null ? jsonEncode(body) : null;
    final response = await client.post(url, headers: headers, body: jsonBody);
    return _handleResponse(response);
  }
}

Map _handleResponse(Response response) {
  switch (response.statusCode) {
    case 400:
      throw HttpError.BAD_REQUEST;
    case 204:
    case 200:
      return response.body.isEmpty ? null : jsonDecode(response.body);
  }
}
