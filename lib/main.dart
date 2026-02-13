import 'package:flutter/material.dart';
import 'package:flutter_week16/views/auth/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: RegisterScreen(),
    );
  }
}
