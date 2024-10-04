import 'package:flutter/material.dart';
import 'categories.dart'; // Import your categories page here
import 'cart.dart'; // Import your cart page here
import 'feedback.dart'; // Import your feedback page here
import 'detail_page.dart';


class CategoryItemPage extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> items;

  CategoryItemPage({required this.title, required this.items, required String categoryName});

  @override
  _CategoryItemPageState createState() => _CategoryItemPageState();
}

class _CategoryItemPageState extends State<CategoryItemPage> {
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  final List<Widget> _pages = [
    CategoriesPage(), // Replace with your actual categories page
    CartPage(), // Replace with your actual cart page
    FeedbackPage(), // Replace with your actual feedback page
    FavouritePage(), // Replace with your actual favourite page
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Function to toggle the favorite status of an item
  void toggleFavorite(int index) {
    setState(() {
      widget.items[index]['isFavorite'] = !(widget.items[index]['isFavorite'] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green.shade900,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.all(16.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.75, // Aspect ratio of grid items
                  ),
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              title: widget.items[index]['title'],
                              imagePath: widget.items[index]['imagePath'],
                              description: widget.items[index]['description'],
                              price: widget.items[index]['price'],
                              isVegetableOrFruit: widget.items[index]['isVegetableOrFruit'],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                                  image: DecorationImage(
                                    image: AssetImage(widget.items[index]['imagePath']), // Assuming 'imagePath' is a path to your image asset
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.items[index]['title'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          widget.items[index]['isFavorite'] == true
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: widget.items[index]['isFavorite'] == true
                                              ? Colors.red // Change to red if favorite
                                              : Colors.grey, // Default grey color
                                        ),
                                        onPressed: () {
                                          toggleFavorite(index); // Toggle favorite status
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Rs. ${widget.items[index]['price']}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: Icon(Icons.arrow_upward),
        backgroundColor: Colors.blue, // Changed the FAB background color
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Navigate to the corresponding page based on index
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => _pages[index]),
          );
        },
        items: [
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
      ),
    );
  }
}

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Page'),
      ),
      body: Center(
        child: Text('This is the Favourite Page'),
      ),
    );
  }
}