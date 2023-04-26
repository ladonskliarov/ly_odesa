part of 'search_post_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchCityState extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchPostState extends SearchState {
  @override
  List<Object> get props => [];
}
