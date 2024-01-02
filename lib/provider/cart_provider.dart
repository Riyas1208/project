import 'package:flutter/material.dart';
import 'package:project/widget/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Product product) {
    int existingIndex = _cartItems.indexWhere((item) => item.product == product);

    if (existingIndex != -1) {
      _cartItems[existingIndex].quantity++;
    } else {
      _cartItems.add(CartItem(product: product));
    }

    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.product == product);
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    int existingIndex = _cartItems.indexWhere((item) => item.product == product);

    if (existingIndex != -1) {
      _cartItems[existingIndex].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(Product product) {
    int existingIndex = _cartItems.indexWhere((item) => item.product == product);

    if (existingIndex != -1) {
      if (_cartItems[existingIndex].quantity > 1) {
        _cartItems[existingIndex].quantity--;
        notifyListeners();
      } else {
        _cartItems.removeAt(existingIndex);
        notifyListeners();
      }
    }
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;

    for (var cartItem in _cartItems) {
      totalPrice += cartItem.product.price * cartItem.quantity;
    }

    return totalPrice;
  }
}
