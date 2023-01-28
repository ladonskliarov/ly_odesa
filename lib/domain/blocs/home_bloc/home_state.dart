part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class ProductsLoadingState extends HomeState {

  @override
  List<Object> get props => [];
}

class ProductsLoadedState extends HomeState {
  final List<Product> plates, drinkingGlasses, glasses, cutlery, other;
  const ProductsLoadedState({required this.plates, required this.drinkingGlasses,
    required this.glasses, required this.cutlery, required this.other
  });

  @override
  List<Object> get props => [plates, drinkingGlasses, glasses, cutlery, other];
}

class ProductsErrorState extends HomeState {
  const ProductsErrorState({required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}