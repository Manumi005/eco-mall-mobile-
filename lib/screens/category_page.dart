import 'package:flutter/material.dart';
import 'category_item_page.dart'; // Import the CategoryItemsPage
import 'favorite_page.dart'; // Import the FavoritePage
import 'cart.dart';

// Sample data for category items
final Map<String, List<Map<String, dynamic>>> categoryItems = {
  'Vegetables': [
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
      'title': 'Cabbage',
      'imagePath': 'assets/images/cabbage.png',
      'description': 'Healthy green cabbage',
      'price': 150.0,
      'isVegetableOrFruit': true,
    },
    {
      'title': 'Cucumber',
      'imagePath': 'assets/images/cucumber.png',
      'description': 'Cool and refreshing cucumbers',
      'price': 300.0,
      'isVegetableOrFruit': true,
    },
    {
      'title': 'Pumpkin',
      'imagePath': 'assets/images/pumpkin.png',
      'description': 'Rich and flavorful pumpkins',
      'price': 250.0,
      'isVegetableOrFruit': true,
    },
    {
      'title': 'Beetroot',
      'imagePath': 'assets/images/beetroot.png',
      'description': 'Fresh and healthy beetroots',
      'price': 300.0,
      'isVegetableOrFruit': true,
    },
  ],
  'Fruits': [
    {
      'title': 'Apple',
      'imagePath': 'assets/images/apple.png',
      'description': 'Crispy and sweet apples',
      'price': 200.0,
      'isVegetableOrFruit': true,
    },
    {
      'title': 'Banana',
      'imagePath': 'assets/images/banana.png',
      'description': 'Rich in potassium',
      'price': 600.0,
      'isVegetableOrFruit': true,
    },
    {
      'title': 'Strawberry',
      'imagePath': 'assets/images/strawberry.png',
      'description': 'Fresh strawberries',
      'price': 500.0,
      'isVegetableOrFruit': true,
    },
    {
      'title': 'Grapes',
      'imagePath': 'assets/images/grapes.png',
      'description': 'Juicy grapes',
      'price': 600.0,
      'isVegetableOrFruit': true,
    },
    {
      'title': 'Mango',
      'imagePath': 'assets/images/mango.png',
      'description': 'Sweet mangoes',
      'price': 200.0,
      'isVegetableOrFruit': true,
    },
    {
      'title': 'Avocado',
      'imagePath': 'assets/images/avocado.png',
      'description': 'Creamy and nutritious avocados',
      'price': 700.0,
      'isVegetableOrFruit': true,
    },
    {
      'title': 'Blueberries',
      'imagePath': 'assets/images/blueberries.png',
      'description': 'Fresh and sweet blueberries',
      'price': 900.0,
      'isVegetableOrFruit': true,
    },
    {
      'title': 'Orange',
      'imagePath': 'assets/images/orange.png',
      'description': 'Juicy and tangy oranges',
      'price': 400.0,
      'isVegetableOrFruit': true,
    },
  ],
  'Bags': [
    {
      'title': 'Beach Bag',
      'imagePath': 'assets/images/beach_bag.png',
      'description': 'Stylish beach bag',
      'price': 500.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Gift Bag',
      'imagePath': 'assets/images/gift_bag.png',
      'description': 'Beautiful gift bag',
      'price': 200.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Lunch Bag',
      'imagePath': 'assets/images/lunch_bag.png',
      'description': 'Insulated lunch bag',
      'price': 300.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Tote Bag',
      'imagePath': 'assets/images/tote_bag.png',
      'description': 'Versatile tote bag',
      'price': 250.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Bamboo Bag',
      'imagePath': 'assets/images/bamboo_bag.jpeg',
      'description': 'Stylish bamboo bag',
      'price': 2500.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Grocery Bag',
      'imagePath': 'assets/images/grocery_bag.png',
      'description': 'Organic Cotton Grocery bag',
      'price': 1000.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Grocery Bag',
      'imagePath': 'assets/images/grocery.png',
      'description': 'Organic Cotton Grocery Bags',
      'price': 500.0,
      'isVegetableOrFruit': false,
    },
  ],
  'Cloths': [
    {
      'title': 'T-shirt',
      'imagePath': 'assets/images/t-shirt.png',
      'description': 'Comfortable cotton t-shirt',
      'price': 300.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Socks',
      'imagePath': 'assets/images/socks.png',
      'description': 'Warm woolen socks',
      'price': 100.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Towels',
      'imagePath': 'assets/images/towels.png',
      'description': 'Soft and absorbent towels',
      'price': 150.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Cotton Cloth',
      'imagePath': 'assets/images/cotton_cloth.png',
      'description': 'High-quality cotton cloth',
      'price': 200.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Hat',
      'imagePath': 'assets/images/hats.jpg',
      'description': 'Stylish and comfortable hat',
      'price': 350.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Cap',
      'imagePath': 'assets/images/caps.png',
      'description': 'Sporty and casual cap',
      'price': 200.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Socks',
      'imagePath': 'assets/images/socks 2.png',
      'description': 'Warm and comfortable socks',
      'price': 150.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Sweater',
      'imagePath': 'assets/images/sweater.png',
      'description': 'Cozy and stylish sweater',
      'price': 500.0,
      'isVegetableOrFruit': false,
    },
  ],

  'Kitchen': [
    {
      'title': 'Cutlery Set',
      'imagePath': 'assets/images/cutlery_set.png',
      'description': 'Stainless steel cutlery set',
      'price': 1500.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Cutting Board',
      'imagePath': 'assets/images/cuttingboard.png',
      'description': 'Wooden cutting board',
      'price': 800.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Plates',
      'imagePath': 'assets/images/plates.png',
      'description': 'Elegant dinner plates',
      'price': 1000.0,
      'isVegetableOrFruit': false,
    },
    {
      'title': 'Kitchen Utilities',
      'imagePath': 'assets/images/kitchen_utilities.png',
      'description': 'Various kitchen utilities',
      'price': 1200.0,
      'isVegetableOrFruit': false,
    },

    {
      'title': 'Charcutery Board',
      'imagePath':'assets/images/charcutery_board.png',
      'description': 'Round Charcutery Board',
      'price': 2200.0,
      'isVegetableOrFruit': false,
    },
  ],
  'HouseHold': [
    {
      'title': 'Plant',
      'imagePath': 'assets/images/plants.jpg',
      'description': 'Decorative indoor plant',
      'price': 250.0,
      'isVegetableOrFruit': false,
    },
  ],
};

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final appBarColor = isDarkMode ? Colors.black : Colors.green;
    final drawerHeaderColor = isDarkMode ? Colors.black : Colors.green;
    final drawerTextColor = isDarkMode ? Colors.white : Colors.green;
    final cardColor = isDarkMode ? Colors.grey[800] : Colors.green;
    final cardTextColor = isDarkMode ? Colors.white : Colors.white;
    final bottomNavBarColor = isDarkMode ? Colors.white : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        title: Text(
          'Categories',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart button tap
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: drawerHeaderColor,
              ),
              child: Text(
                'Hi Manumi, Welcome to Eco Mall',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: drawerTextColor),
              title: Text('Home', style: TextStyle(color: drawerTextColor)),
              onTap: () {
                Navigator.pushNamed(context, '/welcome');
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback, color: drawerTextColor),
              title: Text('Feedback', style: TextStyle(color: drawerTextColor)),
              onTap: () {
                Navigator.pushNamed(context, '/feedback');
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: drawerTextColor),
              title: Text('Favorite', style: TextStyle(color: drawerTextColor)),
              onTap: () {
                Navigator.pushNamed(context, '/favorite');
              },
            ),
            ListTile(
              leading: Icon(Icons.card_membership, color: drawerTextColor),
              title: Text(
                  'Loyalty Programs', style: TextStyle(color: drawerTextColor)),
              onTap: () {
                Navigator.pushNamed(context, '/loyalty');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
                      prefixIcon: Icon(Icons.search, color: textColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: cardColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: textColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: textColor.withOpacity(0.5)),
                      ),
                    ),
                    style: TextStyle(color: textColor),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/logo.png',
                    // Replace with your logo asset path
                    height: 60, // Increase the size of the logo
                    width: 80,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                _buildCategoryCard(
                    'assets/images/vegetables.jpg', 'Vegetables', context,
                    cardColor!, cardTextColor),
                _buildCategoryCard(
                    'assets/images/fruits.jpg', 'Fruits', context, cardColor,
                    cardTextColor),
                _buildCategoryCard(
                    'assets/images/bags.jpg', 'Bags', context, cardColor,
                    cardTextColor),
                _buildCategoryCard(
                    'assets/images/cloths.jpg', 'Cloths', context, cardColor,
                    cardTextColor),
                _buildCategoryCard(
                    'assets/images/kitchen.jpg', 'Kitchen', context, cardColor,
                    cardTextColor),
                _buildCategoryCard(
                    'assets/images/plants.jpg', 'HouseHold', context, cardColor,
                    cardTextColor),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback, color: Colors.black),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.black),
            label: 'Favorite',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        backgroundColor: bottomNavBarColor,
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritePage()),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildCategoryCard(String imagePath, String categoryName, BuildContext context, Color cardColor, Color cardTextColor) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CategoryItemPage(items: categoryItems[categoryName] ?? [], categoryName: categoryName, title: '',),
          ),
        );
      },
      child: Card(
        elevation: 5,
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                categoryName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: cardTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}