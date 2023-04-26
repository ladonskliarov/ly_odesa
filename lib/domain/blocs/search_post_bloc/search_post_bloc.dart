import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ly_odesa/data/repositories/search_delivery_repository/search_delivery_repository.dart';

part 'search_post_event.dart';
part 'search_post_state.dart';

class SearchPostBloc extends Bloc<SearchEvent, SearchState> {
  final SearchDeliveryRepository repository;

  SearchPostBloc(this.repository) : super(SearchInitial()) {

    on<SearchCityEvent>((event, emit) {
      emit(SearchCityState());
    });

    on<SearchPostEvent>((event, emit) {
      emit(SearchPostState());
    });
  }
}
