import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String posterUrl;
  final VoidCallback onBuyTicket;

  const MovieCard({
    super.key,
    required this.title,
    required this.posterUrl,
    required this.onBuyTicket,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Poster Film
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              posterUrl,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // Detail Film
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onBuyTicket,
                  child: const Text('Beli Tiket'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
