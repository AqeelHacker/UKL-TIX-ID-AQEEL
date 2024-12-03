import 'package:flutter/material.dart';
import 'package:tix_id/screen/bioskop.dart';
import 'package:tix_id/screen/tiket.dart';
import 'package:tix_id/screen/tiketku.dart';
import 'package:tix_id/widget/citydropdown.dart';
import 'package:tix_id/widget/slider.dart';
import 'package:tix_id/widget/categorybutton.dart';
import 'package:tix_id/widget/rekomfilm.dart';
import 'package:tix_id/widget/spotlight.dart';
import 'package:tix_id/widget/tixnow.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  // Daftar halaman
  final List<Widget> _pages = [
    DashboardScreen(), // Halaman utama (Beranda)
    const ListBioskop(),
    const MovieScreen(),
    const TicketScreen(),
  ];

  // Fungsi untuk menangani navigasi BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF001A4D),
        title: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.movie,
                  color: Color.fromRGBO(202, 131, 24, 1),
                ),
                SizedBox(width: 8),
                Text(
                  'TIX ID',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF001A4D),
        unselectedItemColor: const Color.fromARGB(255, 76, 99, 147),
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.theaters),
            label: 'Bioskop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            label: 'TiketKu',
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<Map<String, dynamic>> filmData = [
    {
      'title': 'Bila Esok Ibu Tiada',
      'rating': 9.2,
      'imagePath': 'assets/bila.jpeg',
    },
    {
      'title': 'Film Kedua',
      'rating': 8.5,
      'imagePath': 'assets/tfone.jpg',
    },
    {
      'title': 'Film Ketiga',
      'rating': 8.3,
      'imagePath': 'assets/gladiator.jpg',
    },
    {
      'title': 'Film Ketiga',
      'rating': 9.0,
      'imagePath': 'assets/gotou.jpg',
    },
    {
      'title': 'Film Ketiga',
      'rating': 7.0,
      'imagePath': 'assets/pu.jpeg',
    },
  ];

   @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search and icons row
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Cari di TIX ID',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

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
                    selectedCity: 'Jakarta', // Kota default
                    cities: const [
                      'Jakarta',
                      'Malang',
                      'Surabaya',
                      'Yogyakarta',
                      'Bandung',
                      'Jember',
                      'Bali',
                      'Batam',
                      'Balikpapan',
                      'Blitar',
                      'Probolinggo',
                      'Kediri',
                      'Madiun',
                      'Mojokerto',
                    ],
                    onCityChanged: (String newCity) {
                      print('Kota dipilih: $newCity');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // Slider
            const ImageSlider(),

            const SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/TIXVIP.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sedang Tayang",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Aksi untuk tombol "Semua"
                  },
                  child: const Text(
                    "Semua >",
                    style: TextStyle(
                      color: Color(0xFF001A4D),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Gunakan CategoryButton
                  CategoryButton(
                    label: "Semua Film",
                    isSelected: true,
                    onTap: () {
                      print("Semua Film ditekan");
                    },
                  ),
                  CategoryButton(
                    label: "XXI",
                    onTap: () {
                      print("XXI ditekan");
                    },
                  ),
                  CategoryButton(
                    label: "CGV",
                    onTap: () {
                      print("CGV ditekan");
                    },
                  ),
                  CategoryButton(
                    label: "Cinépolis",
                    onTap: () {
                      print("Cinépolis ditekan");
                    },
                  ),
                  CategoryButton(
                    label: "Watchlist",
                    onTap: () {
                      print("Watchlist ditekan");
                    },
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                RecommendationSection(filmData: filmData),
                const SizedBox(height: 16.0),
                const Spotlight(),
                const SizedBox(height: 16.0),

                const Tixnow(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
