import 'package:flutter/material.dart';
import 'register_screen.dart'; // Import your register screen here
import 'login.dart'; // Import the login screen

void main() => runApp(const MyApp());  // Use const for performance optimization

class MyApp extends StatelessWidget {
  const MyApp({super.key});  // Use super.key for the constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Disable the debug banner
      title: 'Free',  // App title
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Set a primary color theme
      ),
      home: const LoginScreen(),  // Set LoginScreen as the home screen
    );
  }
}

@override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScreenLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
