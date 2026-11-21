// Tampilan antarmuka halaman daftar kopi yang
// telah ditandai sebagai favorit oleh pengguna.
import 'package:flutter/material.dart';
import 'package:kopi_nusantara/models/coffe_model.dart';
import 'package:kopi_nusantara/screens/detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Coffee> favoriteCoffees;

  const FavoriteScreen({
    super.key,
    this.favoriteCoffees = const [],
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List<Coffee> _favorites;

  @override
  void initState() {
    super.initState();
    _favorites = List.from(widget.favoriteCoffees);
  }

  void _removeFavorite(Coffee coffee) {
    setState(() {
      _favorites.removeWhere((item) => item.name == coffee.name);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${coffee.name} dihapus dari favorit'),
        duration: const Duration(seconds: 1),
      ),
    );
  }