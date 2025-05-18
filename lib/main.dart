import 'package:flutter/material.dart';
import 'package:reminder/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder app',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(), // Start with the LoginScreen
      debugShowCheckedModeBanner: false, // Optional: hide debug banner
    );
  }
}
