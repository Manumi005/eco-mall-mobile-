import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Check for dark mode
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: isDarkMode ? Colors.green.shade800 : Colors.green.shade400, // Light green
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.green.shade50, // Light green background
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: (orientation == Orientation.portrait)
                ? _buildPortraitLayout(context, isDarkMode)
                : _buildLandscapeLayout(context, isDarkMode),
          );
        },
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context, bool isDarkMode) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDarkMode ? Colors.grey[800] : Colors.green.shade300, // Light green for logo background
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logo.png', // Ensure the correct path to your logo asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Title
            Text(
              'Login to Your Account',
              style: TextStyle(
                color: isDarkMode ? Colors.green.shade200 : Colors.green.shade900, // Light green text
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Form Container
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[850] : Colors.green.shade100, // Light green for form background
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Email Field
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email',
                    isDarkMode: isDarkMode,
                    icon: Icons.email,
                  ),
                  SizedBox(height: 16),
                  // Password Field
                  _buildTextField(
                    controller: _passwordController,
                    label: 'Password',
                    isDarkMode: isDarkMode,
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  // Login Button
                  ElevatedButton(
                    onPressed: () async {
                      await _login(context); // Pass context here
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? Colors.green.shade800 : Colors.green.shade400, // Light green for button
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Sign Up Redirect
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      'Don\'t have an account? Register here!',
                      style: TextStyle(color: isDarkMode ? Colors.green.shade300 : Colors.green.shade900), // Light green for text
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool isDarkMode,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: isDarkMode ? Colors.white70 : Colors.black),
        ),
        filled: true,
        fillColor: isDarkMode ? Colors.grey[850] : Colors.green.shade50, // Light green for fill color
        prefixIcon: Icon(icon, color: isDarkMode ? Colors.white70 : Colors.black),
      ),
      obscureText: obscureText,
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Email Field
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildTextField(
              controller: _emailController,
              label: 'Email',
              isDarkMode: isDarkMode,
              icon: Icons.email,
            ),
          ),
        ),
        // Password Field
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildTextField(
              controller: _passwordController,
              label: 'Password',
              isDarkMode: isDarkMode,
              icon: Icons.lock,
              obscureText: true,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _login(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Check if the user is signed in
      if (userCredential.user != null) {
        // Navigate to the category page
        Navigator.pushReplacementNamed(context, '/category');
      }
    } on FirebaseAuthException catch (e) {
      // Show the error message in a dialog
      _showErrorDialog(context, _getErrorMessage(e));
    } catch (e) {
      // Catch any other exceptions
      _showErrorDialog(context, 'An unexpected error occurred. Please try again.');
    }
  }

  String _getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'The user corresponding to the given email has been disabled.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      default:
        return 'An undefined error occurred.';
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
