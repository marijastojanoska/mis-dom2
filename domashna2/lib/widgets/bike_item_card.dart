import 'package:flutter/material.dart';
import '../models/bike_item.dart';
import '../services/cart_service.dart';

class BikeItemCard extends StatelessWidget {
  final BikeItem bikeItem;

  const BikeItemCard({required this.bikeItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Image.asset(
            bikeItem.bike.imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.broken_image, size: 100);
            },
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bikeItem.bike.modelName),
                Text('\$${bikeItem.bike.price.toStringAsFixed(0)}',),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              CartService.addToCart(bikeItem.bike);
            },
          ),
          Text('${bikeItem.quantity}'),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              if (bikeItem.quantity > 1) {
                bikeItem.quantity--;
              } else {
                CartService.removeFromCart(bikeItem.bike);
              }
            },
          ),
        ],
      ),
    );
  }
}
