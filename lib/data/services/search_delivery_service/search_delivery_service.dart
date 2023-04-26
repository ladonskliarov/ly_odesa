import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ly_odesa/data/models/post/city_api.dart';
import 'package:ly_odesa/data/models/post/post_office_api.dart';
import 'package:ly_odesa/data/repositories/search_delivery_repository/search_delivery_repository.dart';
import 'package:http/http.dart' as http;
import 'package:ly_odesa/privacy_settings.dart';

class SearchDeliveryService implements SearchDeliveryRepository {

  @override
  String choosenCity = '';

  @override
  Set<String> citiesOfOnlineSearch = {};

  @override
  List<String> postOffices = [];

  @override
  List<String> postOfficesResultOfSearch = [];

  @override
  Future fetchPostOffices({required String postOffice}) async {
    try {
      final result = await http.post(Uri.parse("https://api.novaposhta.ua/v2.0/json/"),
          body: jsonEncode(<String, dynamic>{
            "apiKey": novaPoshtaAPIKey,
            "modelName": "AddressGeneral",
            "calledMethod": "getWarehouses",
            "methodProperties": {
              "TypeOfWarehouseRef": "841339c7-591a-42e2-8233-7a0a00f0ed6f",
              "CityName": choosenCity,
              "Language": "ua"
            }
          })
      );

      final response = jsonDecode(result.body) as Map<String, dynamic>;
      final answerInstances = PostOfficeAPI.fromJson(response);
      answerInstances.postOffices!.forEach((element) {
        postOffices.add(element.description!);
      });
      postOfficesResultOfSearch = postOffices;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future searchCityOnline({required String city}) async {
    if(city != null){
      choosenCity = city;
    }
    try {
      final result = await http.post(Uri.parse("https://api.novaposhta.ua/v2.0/json/"),
          body: jsonEncode(<String, dynamic>{
            "apiKey": novaPoshtaAPIKey,
            "modelName": "AddressGeneral",
            "calledMethod": "searchSettlements",
            "methodProperties": {
              "CityName": choosenCity,
              "Language": "ua",
            }
          })
      );

      final response = jsonDecode(result.body) as Map<String, dynamic>;
      final answerInstances = CityAPI.fromJson(response);
      citiesOfOnlineSearch.clear();
      answerInstances.cities?.elementAt(0).cityNames?.forEach((element) {
        citiesOfOnlineSearch.add(element.name!);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}