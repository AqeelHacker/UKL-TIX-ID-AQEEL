import 'package:flutter/material.dart';

class MovieGridView extends StatelessWidget {
  final List<Map<String, String>> movies;

  const MovieGridView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Dua item per baris
        childAspectRatio:
            0.6, // Aspect ratio untuk potret (lebih tinggi dari lebar)
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(
          title: movies[index]['title']!,
          posterPath: movies[index]['poster']!,
          rating: movies[index]['rating']!,
          genre: movies[index]['genre']!,
          ageRating: movies[index]['ageRating']!,
        );
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String posterPath;
  final String rating;
  final String genre;
  final String ageRating;

  const MovieCard({
    super.key,
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.genre,
    required this.ageRating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian gambar poster
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  posterPath,
                  height: 240, // Tinggi gambar (disesuaikan untuk potret)
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Age rating kecil di pojok kanan atas
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    ageRating,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Bagian teks informasi
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  genre,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
