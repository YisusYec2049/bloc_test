import 'package:api_service/api_service.dart';

void main() async {
  final apiService = ApiService(); // Crea una instancia de ApiService.

  final urls = await apiService
      .fetchGifs(); // Realiza una solicitud para obtener URLs de imágenes.

  // Itera a través de las URLs y las imprime en la consola.
  for (final url in urls) {
    print(url);
  }
}
