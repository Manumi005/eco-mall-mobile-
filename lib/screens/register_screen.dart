import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    // Check for dark mode
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: isDarkMode ? Colors.green.shade800 : Colors.green,
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: (orientation == Orientation.portrait)
                ? _buildPortraitLayout(authService, isDarkMode)
                : _buildLandscapeLayout(authService, isDarkMode),
          );
        },
      ),
    );
  }

  Widget _buildPortraitLayout(AuthService authService, bool isDarkMode) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Logo
        Image.asset(
          'assets/images/logo.png', // Update this path to your logo's asset path
          height: 100, // Adjust the height as needed
        ),
        SizedBox(height: 20),
        // Username Field
        _buildTextField(_nameController, 'Username', Icons.person, isDarkMode),
        SizedBox(height: 20),
        // Email Field
        _buildTextField(_emailController, 'Email', Icons.email, isDarkMode),
        SizedBox(height: 20),
        // Password Field
        _buildTextField(_passwordController, 'Password', Icons.lock, isDarkMode, obscureText: true),
        SizedBox(height: 20),
        // Confirm Password Field
        _buildTextField(_confirmPasswordController, 'Confirm Password', Icons.lock, isDarkMode, obscureText: true),
        SizedBox(height: 20),
        // Contact Number Field
        _buildTextField(_contactController, 'Contact Number', Icons.phone, isDarkMode),
        SizedBox(height: 20),
        // Address Field
        _buildTextField(_addressController, 'Address', Icons.home, isDarkMode),
        SizedBox(height: 20),
        // Register Button
        ElevatedButton(
          onPressed: () {
            authService.register(
              _nameController.text,
              _emailController.text,
              _passwordController.text,
              _contactController.text,
              _addressController.text,
            );
          },
          child: Text('Register'),
          style: ElevatedButton.styleFrom(
            backgroundColor: isDarkMode ? Colors.green.shade800 : Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(AuthService authService, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                // Logo
                Image.asset(
                  'assets/logo.png', // Update this path to your logo's asset path
                  height: 100, // Adjust the height as needed
                ),
                SizedBox(height: 20),
                _buildTextField(_nameController, 'Username', Icons.person, isDarkMode),
                SizedBox(height: 20),
                _buildTextField(_emailController, 'Email', Icons.email, isDarkMode),
                SizedBox(height: 20),
                _buildTextField(_contactController, 'Contact Number', Icons.phone, isDarkMode),
              ],
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                _buildTextField(_passwordController, 'Password', Icons.lock, isDarkMode, obscureText: true),
                SizedBox(height: 20),
                _buildTextField(_confirmPasswordController, 'Confirm Password', Icons.lock, isDarkMode, obscureText: true),
                SizedBox(height: 20),
                _buildTextField(_addressController, 'Address', Icons.home, isDarkMode),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, bool isDarkMode, {bool obscureText = false}) {
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
        fillColor: isDarkMode ? Colors.grey[850] : Colors.grey[200],
        prefixIcon: Icon(icon, color: isDarkMode ? Colors.white70 : Colors.black),
      ),
      obscureText: obscureText,
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
    );
  }
}