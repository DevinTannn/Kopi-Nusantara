import 'package:flutter/material.dart';
import 'package:kopi_nusantara/screens/detail_screen.dart';
import 'package:kopi_nusantara/screens/home_screen.dart';
import 'package:kopi_nusantara/data/coffe_data.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kopi Nusantara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      // home: const HomeScreen(),
      home: DetailScreen(coffee: coffeeList[0]),
    );
  }
}