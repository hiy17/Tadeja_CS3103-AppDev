import 'package:flutter/material.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:flutter_application_2/login_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jude Tadeja CV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      initialRoute: '/', 
      routes: {
        '/': (context) => const LoginPage(), 
        '/home': (context) => const HomePage(), 
      },
    );
  }
}
