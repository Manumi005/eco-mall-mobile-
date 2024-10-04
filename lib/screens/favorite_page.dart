import 'package:flutter/material.dart';
import 'product_detail_page.dart';

// Sample data for favorite items
final List<Map<String, dynamic>> favoriteItems = [
  {
    'title': 'Apple',
    'imagePath': 'assets/images/apple.png',
    'description': 'Indulge in the crisp sweetness of our Organic Red Apple. Grown sustainably, each bite bursts with refreshing flavor and vital nutrients. Perfect for snacking or adding a wholesome touch to salads and desserts. Discover the natural goodness of farm-fresh, pesticide-free produce in every delicious mouthful.',
    'price': 100.0,
    'isVegetableOrFruit': true,
  },
  {
    'title': 'Beach Bag',
    'imagePath': 'assets/images/beach_bag.png',
    'description': 'Stylish beach bag',
    'price': 500.0,
    'isVegetableOrFruit': false,
  },
  {
    'title': 'Cutlery Set',
    'imagePath': 'assets/images/cutlery_set.png',
    'description': 'Elevate your dining experience with our Stainless Steel Cutlery Set. This elegant collection includes knives, forks, spoons, and teaspoons, designed for durability and a sleek finish. Perfect for everyday meals or special occasions, it brings sophistication and functionality to your table.',
    'price': 1500.0,
    'isVegetableOrFruit': false,
  },

  {
    'title': 'Tomato',
    'imagePath': 'assets/images/tomato.png',
    'description': 'Fresh and juicy tomatoes',
    'price': 200.0,
    'isVegetableOrFruit': true,
  },
  {
    'title': 'Carrot',
    'imagePath': 'assets/images/carrot.png',
    'description': 'Crunchy and sweet carrots',
    'price': 600.0,
    'isVegetableOrFruit': true,
  },
  {
    'title': 'Cucumber',
    'imagePath': 'assets/images/cucumber.png',
    'description': 'Cool and refreshing cucumbers',
    'price': 400.0,
    'isVegetableOrFruit': true,
  },
];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.green, // Set the primary color swatch for the app
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.lightGreen, // Set the app bar background color
      ),
    ),
    home: FavoritePage(),
  ));
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 0.7,
        children: favoriteItems.map((item) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailPage(item: item)),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.lightGreen[50], // Set a lighter color for the card background
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.asset(
                        item['imagePath'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item['title'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          item['description'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Rs.${item['price'].toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}