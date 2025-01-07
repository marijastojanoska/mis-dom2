import 'package:domashna2/models/bike.dart';
import 'package:flutter/material.dart';
import '../data/dummy_bikes.dart';
import '../widgets/bike_card.dart';
import '../widgets/cart_widget.dart';
import 'bike_details_screen.dart';

class BikesCatalogScreen extends StatefulWidget {
  const BikesCatalogScreen({super.key});

  @override
  _BikesCatalogScreenState createState() => _BikesCatalogScreenState();
}

class _BikesCatalogScreenState extends State<BikesCatalogScreen> {
  String selectedCategory = 'All';

  void _showCart() {
    showModalBottomSheet(
      context: context,
      builder: (_) => CartWidget(),
      isScrollControlled: true,
      backgroundColor: Colors.white,
    );
  }

  final List<Map<String, dynamic>> categories = [
    {'value': 'All', 'icon': 'assets/images/bicycle.png'},
    {'value': 'Mountain', 'icon': 'assets/images/mountain.png'},
    {'value': 'Road', 'icon': 'assets/images/road.png'},
    {'value': 'BMX', 'icon': 'assets/images/accessory.png'},
    {'value': 'Electric', 'icon': 'assets/images/electric.png'},
  ];

  List<Bike> get filteredBikes {
    if (selectedCategory == 'All') {
      return dummyBikes;
    }
    return dummyBikes.where((bike) => bike.category == selectedCategory).toList();
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Pick your bike',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF148d1a),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      iconSize: 32,
                      onPressed: _showCart,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: Image.asset(
              'assets/images/background_catalog.png',
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: categories.map((category) {
                    final isSelected = selectedCategory == category['value'];
                    return GestureDetector(
                      onTap: () => _onCategorySelected(category['value']),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF148d1a) : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          category['icon'],
                          width: 40,
                          height: 40,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredBikes.length,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (context, index) {
                    final bike = filteredBikes[index];
                    return BikeCard(
                      bike: bike,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BikeDetailsScreen(bike: bike),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
