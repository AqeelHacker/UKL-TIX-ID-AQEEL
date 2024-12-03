import 'package:flutter/material.dart';

class Spotlight extends StatelessWidget {
  const Spotlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Row(
            children: [
              Text(
                'Spotlight',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              Text(
                'Berita Terhangat Untuk Anda!',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BoxOfficeWidget(
                  imagePath: 'assets/slider1.jpeg',
                  title: 'TIX ID Box Office (11-17 November)',
                  views: 57,
                  likes: 0,
                ),
                BoxOfficeWidget(
                  imagePath: 'assets/slider2.jpeg',
                  title: 'TIX ID Box Office (11-17 November)',
                  views: 88,
                  likes: 12,
                ),
                BoxOfficeWidget(
                  imagePath: 'assets/slider3.jpeg',
                  title: 'Film Terbaik Minggu Ini',
                  views: 102,
                  likes: 50,
                ),
                BoxOfficeWidget(
                  imagePath: 'assets/slider4.jpeg',
                  title: 'Update Film Terkini',
                  views: 75,
                  likes: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BoxOfficeWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final int views;
  final int likes;

  const BoxOfficeWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.views,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.remove_red_eye, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                '$views',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.favorite_border, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                '$likes',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
