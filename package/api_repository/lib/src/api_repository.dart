import 'package:api_repository/src/models/api_model.dart';
import 'package:api_service/api_service.dart';

/// {@template api_repository}
/// API_Repository
/// {@endtemplate}
class ApiRepository {
  /// {@macro api_repository}
  ApiRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<List<ApiModel>> getUrls() async {
    final List<ApiModel> urls = [];
    try {
      final listUrls = await _apiService.fetchGifs();
      for (final url in listUrls) {
        urls.add(ApiModel(url));
      }
      return urls;
    } catch (error) {
      print('Error en ApiRepository: $error'); // Agrega un registro de error
      throw error; // Lanza la excepción nuevamente para que puedas ver el error específico
    }
  }
}
