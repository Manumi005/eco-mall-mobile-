
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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Title: $title'),
            Text('Description: $description'),
            Text('Price: Rs. $price'),
            Text('Is Vegetable/Fruit: $isVegetableOrFruit'),
            // Add more UI components as needed
          ],
        ),
      ),
    );
  }
}

