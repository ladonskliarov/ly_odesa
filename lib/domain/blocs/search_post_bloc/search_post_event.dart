part of 'search_post_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchCityEvent extends SearchEvent {
  @override
  List<Object> get props => [];
}

class SearchPostEvent extends SearchEvent {
  @override
  List<Object> get props => [];
}