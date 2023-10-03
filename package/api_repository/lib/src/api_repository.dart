import 'package:api_repository/src/models/api_model.dart';
import 'package:api_service/api_service.dart';

class ApiRepository {
  ApiRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  /// Método `getUrls` para obtener una lista de objetos `ApiModel` desde la API.
  Future<List<ApiModel>> getUrls() async {
    final List<ApiModel> urls = [];

    try {
      final listUrls = await _apiService.fetchGifs();

      for (final url in listUrls) {
        urls.add(ApiModel(url));
      }

      return urls; // Devuelve la lista de URLs.
    } catch (error) {
      print(
          'Error en ApiRepository: $error'); // Imprime un mensaje de error en caso de fallo.
      throw error; // Relanza la excepción para que pueda ser manejada en otros lugares si es necesario.
    }
  }
}
