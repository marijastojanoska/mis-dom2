import '../models/bike.dart';
import '../models/bike_item.dart';

class CartService {
  static final List<BikeItem> _cartItems = [];

  static List<BikeItem> get cartItems => _cartItems;

  static void addToCart(Bike bike) {
    final index = _cartItems.indexWhere((item) => item.bike.modelName == bike.modelName);
    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(BikeItem(bike: bike));
    }
  }

  static void removeFromCart(Bike bike) {
    _cartItems.removeWhere((item) => item.bike.modelName == bike.modelName);
  }

  static void clearCart() {
    _cartItems.clear();
  }
}
