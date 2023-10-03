import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient; // Instancia privada de `http.Client`.

  final String baseUrl = 'api.giphy.com';
  final String endPoint = '/v1/gifs/trending';
  final String apiKey = 'M9zd0nowJd524Kt83mmsOJzvWluoGMmQ';

  Future<List<String>> fetchGifs() async {
    final uri = Uri.http(baseUrl, endPoint,
        {'api_key': apiKey}); // Crea la URI para la solicitud.

    http.Response resp;

    List body;
    try {
      resp = await _httpClient.get(uri); // Realiza una solicitud GET a la URI.
    } on Exception {
      throw Exception(); // Captura cualquier excepción y la relanza.
    }
    if (resp.statusCode != 200) {
      throw HttpRequestException(); // Lanza una excepción si la respuesta no es exitosa (código de estado distinto de 200).
    }
    try {
      body = jsonDecode(resp.body)['data']
          as List; // Decodifica la respuesta JSON y extrae la lista de datos.
    } on Exception {
      throw JsonEncodeException(); // Lanza una excepción si ocurre un error al decodificar JSON.
    }
    return body
        .map((url) => url['images']['fixed_height_downsampled']['url']
            .toString()) // Mapea los datos para obtener las URLs de los GIFs.
        .toList(); // Convierte las URLs en una lista y la devuelve.
  }
}

class HttpRequestException implements Exception {}

class JsonEncodeException implements Exception {}
