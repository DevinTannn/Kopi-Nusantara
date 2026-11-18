// INI HANYA TAMPILAN AWAL biar main.dart nggak merah aja
// Jadi boleh dirubah

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kopi Nusantara'),
      ),
      body: const Center(
        child: Text('Selamat Datang di Kopi Nusantara'),
      ),
    );
  }
}