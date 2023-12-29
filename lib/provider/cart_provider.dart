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
      // If the product is already in the cart, increase its quantity
      _cartItems[existingIndex].quantity++;
    } else {
      // If the product is not in the cart, add a new CartItem
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
      // Increase the quantity of the product in the cart
      _cartItems[existingIndex].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(Product product) {
    int existingIndex = _cartItems.indexWhere((item) => item.product == product);

    if (existingIndex != -1) {
      // Decrease the quantity of the product in the cart
      if (_cartItems[existingIndex].quantity > 1) {
        _cartItems[existingIndex].quantity--;
        notifyListeners();
      } else {
        // If the quantity is 1, remove the item from the cart
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
