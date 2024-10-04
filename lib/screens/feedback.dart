import 'dart:io'; // Add this for File
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

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDarkMode ? Colors.blueGrey[900] : Colors.white;
    final secondaryColor = isDarkMode ? Colors.black : Colors.green;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Feedback'),
        backgroundColor: secondaryColor,
        centerTitle: true,
      ),
      body: Padding(
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
                        'assets/logo.png', // Adjust the path to your logo
                        height: 80,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Rate the product:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
                    ),
                    SizedBox(height: 16),
                    Slider(
                      value: _rating,
                      min: 1,
                      max: 5,
                      divisions: 4,
                      label: _rating.toString(),
                      activeColor: secondaryColor,
                      inactiveColor: isDarkMode ? Colors.white54 : Colors.grey,
                      onChanged: (newRating) {
                        setState(() {
                          _rating = newRating;
                        });
                      },
                    ),
                    Center(
                      child: Text(
                        '$_rating / 5',
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
                      child: Text('Select Image'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 10),
                    if (_image != null)
                      Column(
                        children: [
                          Image.file(
                            _image!,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                        ],
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
                        child: Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondaryColor,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          textStyle: TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
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
