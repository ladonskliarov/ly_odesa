import 'package:ly_odesa/data/models/product.dart';
abstract class ProductsRepository {
  late List<Product> plates;
  late List<Product> cutlery;
  late List<Product> drinkingGlasses;
  late List<Product> wineGlasses;
  late List<Product> other;
  late Stream<List<Product>> platesStream;
  late Stream<List<Product>> drinkingGlassesStream;
  late Stream<List<Product>> wineGlassesStream;
  late Stream<List<Product>> cutleryStream;
  late Stream<List<Product>> otherStream;
}