import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/repositories/home_repository.dart';
import 'package:news_app/core/services/home_services.dart';
import 'package:news_app/features/home/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  final HomeRepository homeRepository = HomeRepository(HomeServices());

  Future<void> getTopHeadlines() async {
    emit(LoadingTopHeadlinesState());

    try {
      final response = await homeRepository.fetchTopHeadlines();
      emit(SuccessHeadLineState(response));
    } catch (e) {
      emit(ErrorTopHeadlineState(e.toString()));
    }
  }
}
