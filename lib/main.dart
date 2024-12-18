import 'package:flutter/material.dart';
import 'home.dart';
import 'menu_darwer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {    
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PT Peminjaman Farhan ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
