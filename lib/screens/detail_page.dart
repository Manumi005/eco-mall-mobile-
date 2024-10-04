import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  final double price;
  final bool isVegetableOrFruit;

  DetailPage({
    required this.title,
    required this.imagePath,
    required this.description,
    required this.price,
    required this.isVegetableOrFruit,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the device's brightness (for dark mode)
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    // Define colors based on the mode
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final cardColor = isDarkMode ? Colors.grey[800] : Colors.green[100];
    final appBarColor = isDarkMode ? Colors.black : Colors.green;
    final buttonColor = isDarkMode ? Colors.green[800] : Colors.green;
    final bottomNavBarColor = isDarkMode ? Colors.black : Colors.white;
    final navBarSelectedColor = isDarkMode ? Colors.white : Colors.green;
    final navBarUnselectedColor = isDarkMode ? Colors.grey : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: appBarColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Card to wrap the product image and details
              Card(
                color: cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Product image
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.asset(
                        imagePath,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Product Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Product Description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Price
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Price: Rs. $price',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Add to Cart Button
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implement add to cart functionality here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Added to Cart!')),
                      );
                    },
                    icon: Icon(Icons.add_shopping_cart),
                    label: Text("Add to Cart"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),

                  // Add to Favorite Button
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implement add to favorite functionality here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Added to Favorites!')),
                      );
                    },
                    icon: Icon(Icons.favorite),
                    label: Text("Add to Favorites"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bottomNavBarColor,
        selectedItemColor: navBarSelectedColor,
        unselectedItemColor: navBarUnselectedColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/welcome');
              break;
            case 1:
              Navigator.pushNamed(context, '/cart');
              break;
            case 2:
              Navigator.pushNamed(context, '/feedback');
              break;
            case 3:
              Navigator.pushNamed(context, '/favorite');
              break;
          }
        },
      ),
    );
  }
}
