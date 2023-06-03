import 'package:ly_odesa/data/models/post/city.dart';

class CityAPI {
  CityAPI({
    this.cities,
  });

  List<City>? cities;

  factory CityAPI.fromJson(Map<String, dynamic> json) {
    return CityAPI(
        cities: (json['data'] as List)
            .map((dynamic e) => City.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}