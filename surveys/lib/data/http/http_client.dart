import 'package:http/http.dart';
import 'package:meta/meta.dart';

abstract class HttpClient {
  Client client;

  Future<Map> request({@required String url, @required String method, Map body});
}
