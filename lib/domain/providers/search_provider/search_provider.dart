import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:ly_odesa/data/models/post/city_api.dart';
import 'package:ly_odesa/data/models/post/post_office_api.dart';

class SearchProvider extends ChangeNotifier {
  Set<String> cities = {};
  List<String> posts = [];
  List<String> postResults = [];
  String choosenCity = 'Одеса';
  String choosenPostOffice = '';

  void initializeCities(){
    fetchCity(choosenCity);
    notifyListeners();
  }

  void chooseCity(String value){
    choosenCity = value;
    notifyListeners();
  }

  void choosePostOffice(String value){
    choosenPostOffice = value;
    notifyListeners();
  }

  void searchPost(String value){
    postResults = posts.where((element) => element.contains(value)).toList();
    notifyListeners();
  }

  Future fetchPosts(String value) async {
    try {
      final result = await http.post(Uri.parse("https://api.novaposhta.ua/v2.0/json/"),
          body: jsonEncode(<String, dynamic>{
            "apiKey": "aef36c8ed5e48be1832d228c03d041ca",
            "modelName": "AddressGeneral",
            "calledMethod": "getWarehouses",
            "methodProperties": {
              "TypeOfWarehouseRef": "841339c7-591a-42e2-8233-7a0a00f0ed6f",
              "CityName": value,
              "Language": "ua"
            }
          })
      );

      final response = jsonDecode(result.body) as Map<String, dynamic>;
      final answerInstances = PostOfficeAPI.fromJson(response);
      answerInstances.postOffices!.forEach((element) {
        posts.add(element.description!);
      });
      postResults = posts;
    } catch (e) {}

    notifyListeners();
  }

  Future fetchCity(String value) async {
    try {
      final result = await http.post(Uri.parse("https://api.novaposhta.ua/v2.0/json/"),
          body: jsonEncode(<String, dynamic>{
            "apiKey": "aef36c8ed5e48be1832d228c03d041ca",
            "modelName": "AddressGeneral",
            "calledMethod": "searchSettlements",
            "methodProperties": {
              "CityName": value,
              "Language": "ua",
            }
          })
      );

      final response = jsonDecode(result.body) as Map<String, dynamic>;
      final answerInstances = CityAPI.fromJson(response);
      cities.clear();
      answerInstances.cities?.elementAt(0).cityNames?.forEach((element) {
        cities.add(element.name!);
      });
    } catch (e) {}

    notifyListeners();
  }

}