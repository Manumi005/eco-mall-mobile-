import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/category_item_page.dart';
import 'screens/category_page.dart';
import 'firebase_options.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'services/auth_service.dart';
import 'screens/data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: 'Eco Mall System',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => WelcomeScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
          '/category': (context) => CategoryPage(),
          // Category Item Routes
          '/vegetables': (context) => CategoryItemPage(
            title: 'Vegetables',
            items: vegetableItems,
            categoryName: 'Vegetables',
          ),
          '/fruits': (context) => CategoryItemPage(
            title: 'Fruits',
            items: fruitItems,
            categoryName: 'Fruits',
          ),
          '/bags': (context) => CategoryItemPage(
            title: 'Bags',
            items: bagItems,
            categoryName: 'Bags',
          ),
          '/cloths': (context) => CategoryItemPage(
            title: 'Cloths',
            items: clothItems,
            categoryName: 'Cloths',
          ),
          '/kitchen': (context) => CategoryItemPage(
            title: 'Kitchen Items',
            items: kitchenItems,
            categoryName: 'Kitchen',
          ),
        },
      ),
    );
  }
}
