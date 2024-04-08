import 'package:http/http.dart' as http;
import 'package:jars/jars.dart';
import 'error_handler.dart';

class HttpService with CustomExceptionHandler {
  final String baseUrl;
  final String? auth;
  HttpService(this.baseUrl, {this.auth});

  Future<http.Response?> get({
    String? startAt,
    String? endAt,
    String? equalTo,
    String? orderBy,
    int? limitToFirst,
    int? limitToLast,
  }) {
    var url = '$baseUrl?';
    if (auth != null) url = '${url}auth=$auth&';
    if (orderBy != null) url = '${url}orderBy="$orderBy"&';
    if (startAt != null) url = '${url}startAt="$startAt"&';
    if (endAt != null) url = '${url}endAt="$endAt"&';
    if (equalTo != null) url = '${url}equalTo="$equalTo"&';
    if (limitToFirst != null) url = '${url}limitToFirst=$limitToFirst&';
    if (limitToLast != null) url = '${url}limitToLast=$limitToLast&';
    return errorHandler<http.Response>(() {
      return http.get(Uri.parse(url));
    });
  }

  Future<http.Response?> patch(JSON json) {
    var url = '$baseUrl?';
    if (auth != null) url = '${url}auth=$auth&';
    return errorHandler<http.Response>(() {
      return http.patch(Uri.parse(url), body: json);
    });
  }
}
