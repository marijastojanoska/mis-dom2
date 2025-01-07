import 'package:flutter/cupertino.dart';
import '../models/bike.dart';
import '../models/bike_item.dart';

class CartService with ChangeNotifier {
  final List<BikeItem> _cartItems = [];

  List<BikeItem> get cartItems => _cartItems;

  void addToCart(Bike bike) {
    final index =
        _cartItems.indexWhere((item) => item.bike.modelName == bike.modelName);
    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(BikeItem(bike: bike));
    }
    notifyListeners();
  }

  void removeFromCart(Bike bike) {
    final index =
        _cartItems.indexWhere((item) => item.bike.modelName == bike.modelName);
    if (index != -1 && _cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
    } else {
      _cartItems.removeWhere((item) => item.bike.modelName == bike.modelName);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double totalPrice() {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.bike.price * item.quantity;
    }
    return total;
  }
}
