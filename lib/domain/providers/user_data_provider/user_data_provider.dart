import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ly_odesa/data/models/my_user.dart';

class UserDataProvider extends ChangeNotifier {
  MyUser? _user;
  MyUser? get user => _user;

  fetchUser() async {
    final userAuth = FirebaseAuth.instance.currentUser?.uid;
    try {
    if(userAuth == null) {
      return;
    } else {
      final userInFirestore = await FirebaseFirestore.instance.collection('users').doc(userAuth).get();
      final userJson = userInFirestore.data();
      final user = MyUser.fromJson(userJson!);
      _user = user;
    }
    notifyListeners();
    } catch (e) {}
  }

  signOutUser() {
    if(_user != null){
      _user = null;
      notifyListeners();
    }
  }
}