import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<dynamic> favoriteCoffees;

  const FavoriteScreen({
    super.key,
    this.favoriteCoffees = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF6F0),
        elevation: 0,
        title: const Text(
          'Kopi Favorit',
          style: TextStyle(
            color: Color(0xFF2B1B15),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: favoriteCoffees.isEmpty
          ? const Center(
              child: Text(
                'Belum ada kopi favorit tersimpan.',
                style: TextStyle(color: Color(0xFF7D6B62)),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: favoriteCoffees.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final coffee = favoriteCoffees[index];
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFE5D7C5)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gambar kopi di sebelah kiri
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          coffee.imageAsset,
                          width: 105,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Informasi kopi di sebelah kanan
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    coffee.province.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Color(0xFF8C6239),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF6EFE6),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: const Color(0xFFE5D7C5),
                                    ),
                                  ),
                                  child: Text(
                                    coffee.variety.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF8C6239),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              coffee.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2B1B15),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 14,
                                  color: Color(0xFF7D6B62),
                                ),
                                const SizedBox(width: 3),
                                Expanded(
                                  child: Text(
                                    coffee.region,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF7D6B62),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: coffee.flavors.take(2).map<Widget>((flavor) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF3ECE2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    flavor.toString(),
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF6D5446),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}