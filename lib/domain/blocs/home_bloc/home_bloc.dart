import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ly_odesa/data/models/product.dart';
import 'package:ly_odesa/data/repositories/products_repository/products_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductsRepository _productsRepository;
  HomeBloc(this._productsRepository) : super(ProductsLoadingState()) {
    _productsRepository.cutleryStream.listen((list) {
      for (Product product in list) {
        _productsRepository.cutlery.add(product);
        add(LoadProducts());
      }
    });
    _productsRepository.platesStream.listen((list) {
      for (Product product in list) {
        _productsRepository.plates.add(product);
        add(LoadProducts());
      }
    });
    _productsRepository.drinkingGlassesStream.listen((list) {
      for (Product product in list) {
        _productsRepository.drinkingGlasses.add(product);
        add(LoadProducts());
      }

    });
    _productsRepository.wineGlassesStream.listen((list) {
      for (Product product in list) {
        _productsRepository.wineGlasses.add(product);
        add(LoadProducts());
      }
    });
    _productsRepository.otherStream.listen((list) {
      for (Product product in list) {
        _productsRepository.other.add(product);
        add(LoadProducts());
      }
    });

      on<LoadProducts>((event, emit) async {
        emit(ProductsLoadingState());
        try {
        emit(ProductsLoadedState(
            plates: _productsRepository.plates,
            drinkingGlasses: _productsRepository.drinkingGlasses,
            glasses: _productsRepository.wineGlasses,
            cutlery: _productsRepository.cutlery,
            other: _productsRepository.other
        ));
        } catch (error) {
          emit(ProductsErrorState(error: error.toString()));
        }
      });
    }

}
