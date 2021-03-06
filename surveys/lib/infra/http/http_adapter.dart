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

    var response = Response('', 500);

    try {
      if (method == 'post') {
        response = await client.post(url, headers: headers, body: jsonBody);
      }
    } catch (error) {
      throw HttpError.SERVER_ERROR;
    }

    return _handleResponse(response);
  }
}

Map _handleResponse(Response response) {
  switch (response.statusCode) {
    case 200:
    case 204:
      return response.body.isEmpty ? null : jsonDecode(response.body);
    case 400:
      throw HttpError.BAD_REQUEST;
    case 401:
      throw HttpError.UNAUTHORIZED;
    case 403:
      throw HttpError.FORBIDDEN;
    case 404:
      throw HttpError.NOT_FOUND;
    case 500:
    default:
      throw HttpError.SERVER_ERROR;
  }
}
