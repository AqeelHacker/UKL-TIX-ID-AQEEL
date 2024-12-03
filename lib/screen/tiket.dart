import 'package:flutter/material.dart';
import 'package:tix_id/movie/movielist.dart';
import 'package:tix_id/widget/gridviewmovie.dart';
import 'package:tix_id/widget/citydropdown.dart'; // Make sure this is imported

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Film Bioskop'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Sedang Tayang'),
              Tab(text: 'Akan Datang'),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on, color: Color(0xFF001A4D)),
                  const SizedBox(width: 10),
                  CityDropdown(
                    selectedCity: 'Jakarta',
                    cities: const [
                      'Jakarta', 'Malang', 'Surabaya', 'Yogyakarta', 'Bandung', 'Jember',
                      'Bali', 'Batam', 'Balikpapan', 'Blitar', 'Probolinggo', 'Kediri',
                      'Madiun', 'Mojokerto',
                    ],
                    onCityChanged: (String newCity) {
                      print('Kota dipilih: $newCity');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MovieGridView(movies: MovieList.nowPlaying),  
                  MovieGridView(movies: MovieList.upcoming),    
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
