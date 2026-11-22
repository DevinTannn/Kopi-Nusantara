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

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const Text(
                'KOLEKSI PILIHANMU',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Color(0xFF8C6239),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Kopi Favorit',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2B1B15),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Simpan kopi yang ingin kamu seduh kembali.',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF6D5D56),
                ),
              ),
              const SizedBox(height: 18),

              // Daftar kopi favorit
              Expanded(
                child: _favorites.isEmpty
                    ? const Center(
                        child: Text(
                          'Belum ada kopi favorit tersimpan.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6D5D56),
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _favorites.length,
                        itemBuilder: (context, index) {
                          final coffee = _favorites[index];
                          return _buildFavoriteCard(coffee);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
