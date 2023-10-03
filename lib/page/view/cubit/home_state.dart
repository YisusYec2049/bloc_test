part of 'home_cubit.dart';

// Enumeración para representar diferentes estados de la pantalla de inicio.
enum HomeStatus { loading, success, error }

// Clase que representa el estado de la pantalla de inicio.
class HomeState {
  HomeState({
    this.status = HomeStatus.loading,
    this.apis = const <ApiModel>[],
  });

  final HomeStatus status;
  final List<ApiModel> apis;

  // Método para crear una copia del estado actual con opciones de actualización.
  HomeState copyWith({
    HomeStatus? status,
    List<ApiModel>? apis,
  }) {
    // Crea y devuelve una nueva instancia de HomeState.
    return HomeState(
      status: status ?? this.status,
      apis: apis ??
          this.apis, // Utiliza la nueva lista de modelos de API o la actual si no se proporciona una nueva.
    );
  }
}
