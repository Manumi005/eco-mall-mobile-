import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check if the current theme is dark mode
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            // Gray box to contain the content
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[850] : Colors.lightGreen[100], // Light green for light mode
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Inner padding for content
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image added here
                  Image.asset(
                    'assets/images/Slider3.png', // Placeholder image
                    height: 300,
                    width: 400,
                    fit: BoxFit.contain, // Ensure the image fits within the container
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your Eco-Friendly Shopping App',
                    style: TextStyle(
                      color: isDarkMode ? Colors.green.shade200 : Colors.green.shade900,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Discover sustainable products and shop responsibly.',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.brown,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  // Renamed button to "Get Started"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Get Started",
                      style: TextStyle(color: Colors.black), // Black text for the button
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? Colors.green.shade800 : Colors.green.shade400, // Button color based on mode
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.lightGreen[50], // Light green background for light mode
    );
  }
}
