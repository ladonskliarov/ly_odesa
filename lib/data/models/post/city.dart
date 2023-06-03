class City {
  City({
    this.cityNames,
  });

  List<CityName>? cityNames;

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        cityNames: (json['Addresses'] as List).map(
                (dynamic e) => CityName.fromJson(
                    e as Map<String, dynamic>),
        ).toList(),
    );
  }
}

class CityName {
  CityName({
    this.name
  });

  String? name;

  factory CityName.fromJson(Map<String, dynamic> json) {
    return CityName(
        name: json['MainDescription'] as String?
    );
  }
}
