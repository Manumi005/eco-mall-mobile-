import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  double _rating = 3.0; // Default rating
  String _feedback = '';
  File? _image; // To store the selected image

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    // Show dialog to choose between gallery or camera
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an option'),
          actions: <Widget>[
            TextButton(
              child: Text('Camera'),
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  setState(() {
                    _image = File(pickedFile.path);
                  });
                }
              },
            ),
            TextButton(
              child: Text('Gallery'),
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    _image = File(pickedFile.path);
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  // Build star rating widget
  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.yellow[700] ?? Colors.yellow, // Ensure non-null
            size: 40,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1.0;
            });
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDarkMode ? Colors.black87 : Colors.white; // Background color for light and dark mode
    final secondaryColor = isDarkMode ? Colors.blueGrey[800] ?? Colors.blueGrey : Colors.green; // Button color
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final buttonColor = isDarkMode ? Colors.tealAccent : Colors.orangeAccent; // Button background color
    final imageColor = isDarkMode ? Colors.grey[800] ?? Colors.grey : Colors.grey[200]; // Image background color

    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Feedback'),
        backgroundColor: secondaryColor,
        centerTitle: true,
      ),
      body: Container(
        color: primaryColor, // Set background color
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Add a logo at the top
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png', // Adjust the path to your logo
                        height: 80,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Rate the product:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
                    ),
                    SizedBox(height: 16),
                    _buildStarRating(),
                    SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Rating: $_rating / 5',
                        style: TextStyle(fontSize: 18, color: textColor),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Your feedback:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Write your feedback here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: secondaryColor, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: secondaryColor, width: 2),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _feedback = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your feedback';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Upload a picture (optional):',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text(
                        'Select Image',
                        style: TextStyle(color: Colors.black), // Button text color changed to black
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor, // Change button color
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Increased padding
                        textStyle: TextStyle(fontSize: 18),
                        minimumSize: Size(200, 50), // Increased button width
                      ),
                    ),
                    SizedBox(height: 10),
                    if (_image != null)
                      Container(
                        decoration: BoxDecoration(
                          color: imageColor, // Image background color
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.file(
                              _image!,
                              height: 200, // Increased image height
                              width: 200,  // Increased image width
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Here, you'd normally submit the feedback to the backend
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Thank you for your feedback!')),
                            );
                            // Reset the form
                            setState(() {
                              _rating = 3.0;
                              _feedback = '';
                              _image = null; // Reset image
                            });
                          }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.black), // Button text color changed to black
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent, // Change button color to a brighter shade
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Increased padding
                          textStyle: TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(200, 50), // Increased button width
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
