import 'package:flutter/material.dart';
import 'package:test_assignment/screens/cart_screen.dart';
import 'package:test_assignment/screens/main_screen.dart';
import 'package:test_assignment/screens/product_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: const MainScreen(),
        initialRoute: '/main_screen',
        routes: {
          '/product_details_screen': (context) => ProductDetailsScreen(),
          '/cart_screen': (context) => CartScreen(),
          '/main_screen': (context) => MainScreen(),
        }
    );
  }
}


