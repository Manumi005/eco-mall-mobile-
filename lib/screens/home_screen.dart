import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: (orientation == Orientation.portrait)
                ? Text('Welcome to the Home Screen!', style: TextStyle(fontSize: 24))
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 48),
                SizedBox(width: 20),
                Text('Welcome to the Home Screen!', style: TextStyle(fontSize: 24)),
              ],
            ),
          );
        },
      ),
    );
  }
}
