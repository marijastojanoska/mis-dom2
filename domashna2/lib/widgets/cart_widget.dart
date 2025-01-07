import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import '../widgets/bike_item_card.dart';

class CartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('My Cart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: CartService.cartItems.length,
              itemBuilder: (context, index) {
                return BikeItemCard(bikeItem: CartService.cartItems[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                CartService.clearCart();
                Navigator.pop(context);
              },
              child: Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
