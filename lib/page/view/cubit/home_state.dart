part of 'home_cubit.dart';

enum HomeStatus { loading, succes, error }

class HomeState {
  HomeState({
    this.status = HomeStatus.loading,
    this.apis = const <ApiModel>[],
  });
  final HomeStatus status;
  final List<ApiModel> apis;

  HomeState copyWith({
    HomeStatus? status,
    List<ApiModel>? apis,
  }) {
    return HomeState(status: status ?? this.status, apis: apis ?? this.apis);
  }
}
