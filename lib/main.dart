import 'package:flutter/material.dart';
import 'package:flutter_project/auth/login.dart';
import 'package:flutter_project/components/navbar.dart';
import 'package:flutter_project/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
