import 'dart:convert';

import 'package:http/http.dart' as http;

/// {@template api_service}
/// API_Service
/// {@endtemplate}
class ApiService {
  /// {@macro api_service}
  ApiService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  final String baseUrl = 'api.giphy.com';
  final String endPoint = '/v1/gifs/trending';
  final String apiKey = 'M9zd0nowJd524Kt83mmsOJzvWluoGMmQ';

  Future<List<String>> fetchGifs() async {
    final uri = Uri.http(baseUrl, endPoint, {'api_key': apiKey});

    http.Response resp;

    List body;
    try {
      resp = await _httpClient.get(uri);
    } on Exception {
      throw Exception();
    }
    if (resp.statusCode != 200) {
      throw HttpRequestException();
    }
    try {
      body = jsonDecode(resp.body)['data'] as List;
    } on Exception {
      throw JsonEncodeException();
    }
    return body
        .map((url) =>
            url['images']['fixed_height_downsampled']['url'].toString())
        .toList();
  }
}

class HttpRequestException implements Exception {}

class JsonEncodeException implements Exception {}
