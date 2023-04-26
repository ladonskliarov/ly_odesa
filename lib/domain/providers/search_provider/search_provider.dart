import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:ly_odesa/data/models/my_user.dart';
import 'package:ly_odesa/data/models/post/city_api.dart';
import 'package:ly_odesa/data/models/post/post_office_api.dart';
import 'package:ly_odesa/privacy_settings.dart';

class SearchProvider extends ChangeNotifier {
  Set<String> cities = {};
  List<String> posts = [];
  List<String> postResults = [];
  String choosenCity = 'Місто';
  String choosenPostOffice = 'Відділення Нової пошти';

  Future<void> initializeCityAndPost() async {
    final userAuth = FirebaseAuth.instance.currentUser?.uid;
    try {
      if(userAuth == null) {
        return;
      } else {
        final userInFirestore = await FirebaseFirestore.instance.collection('users').doc(userAuth).get();
        final userJson = userInFirestore.data();
        final user = MyUser.fromJson(userJson!);
        choosenCity = user.city;
        choosenPostOffice = user.numberOfNovaPoshta;
      }
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  void chooseCity(String value){
    choosenCity = value;
    posts.clear();
    postResults.clear();
    choosenPostOffice = 'Відділення Нової пошти';
    fetchPostOffices();
    notifyListeners();
  }

  void choosePostOffice(String value){
    choosenPostOffice = value;
    notifyListeners();
  }

  searchPostOffice([String? value = 'Одеса']){
    postResults = posts.where((element) => element.contains(value!)).toList();
    notifyListeners();
  }

  Future fetchPostOffices() async {
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
        posts.add(element.description!);
      });
      postResults = posts;
    } catch (e) {
      debugPrint(e.toString());
    }

    notifyListeners();
  }

  Future onlineSearchCity([String? value]) async {
    if(value != null){
      choosenCity = value;
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
      cities.clear();
      answerInstances.cities?.elementAt(0).cityNames?.forEach((element) {
        cities.add(element.name!);
      });
    } catch (e) {
      debugPrint(e.toString());
    }

    notifyListeners();
  }

  void clearPostData(){
    choosenCity = 'Місто';
    choosenPostOffice = 'Відділення Нової пошти';
    notifyListeners();
  }

}