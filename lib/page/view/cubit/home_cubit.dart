import 'package:api_repository/api_repository.dart';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.apiRepository) : super(HomeState());

  final ApiRepository apiRepository;

  Future<void> getData() async {
    try {
      final apiUrls = await apiRepository.getUrls();
      emit(state.copyWith(status: HomeStatus.succes, apis: apiUrls));
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
