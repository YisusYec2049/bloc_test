import 'package:api_repository/api_repository.dart';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

// Aqui se declara la clase HomeCubit que gestiona el estado de la pantalla de inicio.
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.apiRepository) : super(HomeState());

  final ApiRepository apiRepository;

  // Se crea un metodo para obtener datos de la API y actualizar el estado en consecuencia.
  Future<void> getData() async {
    try {
      final apiUrls = await apiRepository.getUrls();

      // Emite un nuevo estado actualizando el estado a éxito (succes) y la lista de URLs.
      emit(state.copyWith(status: HomeStatus.success, apis: apiUrls));
    } catch (_) {
      // En caso de error en la llamada a la API, emite un nuevo estado con un estado de error.
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
