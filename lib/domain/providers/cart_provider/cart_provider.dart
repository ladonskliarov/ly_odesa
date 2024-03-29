import 'package:flutter/material.dart';
import 'package:ly_odesa/data/models/cart.dart';
import 'package:ly_odesa/data/models/product.dart';

class CartProvider extends ChangeNotifier {
  Cart _cart = Cart(products: [], cartPrice: 0);
  int _amountBuy = 0;

  int get amountBuy => _amountBuy;
  Cart get cart => _cart;

  void _addProduct(Object product) {
    if (product is Product) {
      _cart.products.add(product);
      _cart.cartPrice += _amountBuy * product.price;
      notifyListeners();
    } else {
      throw ArgumentError("Invalid product type");
    }
  }

  void clearCart(){
    _cart.products.clear();
    _cart.cartPrice = 0;
    notifyListeners();
  }

  void updateProduct(int index) {
    _cart.cartPrice =
        _cart.products[index].price * _cart.products[index].amount;
    _cart.products[index].amount += amountBuy;
    _cart.cartPrice =
        _cart.products[index].amount * _cart.products[index].price;
    notifyListeners();
  }

  bool _checkOnAmount(
      {required Product productInCart, required Product newInputProduct}) {
    bool value = true;
    if (productInCart.amount + _amountBuy > newInputProduct.amount) {
      value = false;
    }
    return value;
  }

  bool checkOnProductInCart(
      {required Product productInCart, required Product newInputProduct}) {
    bool value = false;
    if (productInCart.id == newInputProduct.id) {
      value = true;
    }
    return value;
  }

  void addProductToCart(Product newInputProduct) {
    if (_cart.products.isEmpty) {
      _addProduct(newInputProduct);
    } else {
      for (int index = 0; index != _cart.products.length; index++) {
        if (checkOnProductInCart(
            productInCart: _cart.products[index],
            newInputProduct: newInputProduct)) {
          if (_checkOnAmount(
              productInCart: _cart.products[index],
              newInputProduct: newInputProduct)) {
            if (index != _cart.products.length) {
              updateProduct(index);
              break;
            }
          }
        } else {
          if (index == _cart.products.length - 1) {
            _addProduct(newInputProduct);
            break;
          }
        }
      }
    }
    notifyListeners();
  }

  void removeProductFromCart({required Product deletedProduct}) {
    for (Product product in _cart.products) {
      if (product.id == deletedProduct.id) {
        _cart.cartPrice -= product.amount * product.price;
        _cart.products.remove(product);
      }
    }
    notifyListeners();
  }

  void plusAmountBuy({required int amount}) {
    if (_amountBuy < 99 && _amountBuy < amount) {
      _amountBuy++;
    } else {
      return;
    }
    notifyListeners();
  }

  void minusAmountBuy() {
    if (_amountBuy != 0) {
      _amountBuy--;
    } else {
      return;
    }
    notifyListeners();
  }

  void clearAmountBuy() {
    _amountBuy = 0;
    notifyListeners();
  }
}
