
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ly_odesa/data/models/product.dart';
import 'package:ly_odesa/data/repositories/products_repository/products_repository.dart';

class FirestoreService implements ProductsRepository{

  @override
  Stream<List<Product>> cutleryStream = FirebaseFirestore.instance.collection('products').doc('cutlery').collection('goods')
      .snapshots().map((snapshot) => snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

  @override
  Stream<List<Product>> otherStream = FirebaseFirestore.instance.collection('products').doc('other').collection('goods')
      .snapshots().map((snapshot) => snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

  @override
  Stream<List<Product>> platesStream = FirebaseFirestore.instance.collection('products').doc('plates').collection('goods')
      .snapshots().map((snapshot) => snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

  @override
  Stream<List<Product>> drinkingGlassesStream = FirebaseFirestore.instance.collection('products').doc('drinkingGlasses').collection('goods')
  .snapshots().map((snapshot) => snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

  @override
  Stream<List<Product>> wineGlassesStream = FirebaseFirestore.instance.collection('products').doc('wineGlasses').collection('goods')
      .snapshots().map((snapshot) => snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

  @override
  List<Product> cutlery = [];

  @override
  List<Product> drinkingGlasses = [];

  @override
  List<Product> other = [];

  @override
  List<Product> plates = [];

  @override
  List<Product> wineGlasses = [];

}