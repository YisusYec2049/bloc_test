import 'package:api_service/api_service.dart';

void main() async {
  final apiService = ApiService();
  final urls = await apiService.fetchGifs();
  for (final url in urls) {
    print(url);
  }
}
