import 'package:ly_odesa/data/models/product.dart';
import 'package:ly_odesa/data/models/product/products.dart';

class JSONConverter {
  Product fromJson(Map<String, dynamic> json){
    if (json['type'] == 'plate'){
      return Plate.fromJson(json);
    } else if (json['type'] == 'drinkingGlasses'){
      return DrinkingGlasses.fromJson(json);
    } else if (json['type'] == 'wineGlasses') {
      return WineGlasses.fromJson(json);
    } else if (json['type'] == 'cutlery') {
      return Cutlery.fromJson(json);
    } else if (json['type'] == 'other') {
      return Other.fromJson(json);
    } else {
      throw 'JSONConverter fromJson exception';
    }
  }

  Map<String, dynamic> toJson(Product product){
    if(product is Plate){
      return product.toJson();
    } else if (product is DrinkingGlasses) {
      return product.toJson();
    } else if (product is WineGlasses) {
      return product.toJson();
    } else if (product is Cutlery) {
      return product.toJson();
    } else if (product is Other) {
      return product.toJson();
    } else {
      throw 'JSONConverter toJson exception';
    }
  }
}