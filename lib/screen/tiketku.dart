import 'package:flutter/material.dart';
import 'package:tix_id/widget/citydropdown.dart';


class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> tickets = [
      {
        'movie': 'The Marvels',
        'cinema': 'XXI Jakarta',
        'date': '1 Desember 2024',
        'time': '18:30',
        'status': 'Aktif',
        'image': 'assets/tm.jpeg',
      },
      {
        'movie': 'Saw X',
        'cinema': 'XXI Surabaya',
        'date': '25 November 2024',
        'time': '20:00',
        'status': 'Selesai',
        'image': 'assets/sawx.jpeg',
      },
      {
        'movie': 'Transformers: ONE',
        'cinema': 'XXI Bali',
        'date': '10 November 2024',
        'time': '14.20',
        'status': 'Selesai',
        'image': 'assets/tfone.jpg',
      },
      {
        'movie': 'Petak Umpet',
        'cinema': 'XXI Bali',
        'date': '5 November 2024',
        'time': '19:15',
        'status': 'Selesai',
        'image': 'assets/pu.jpeg',
      },
      {
        'movie': 'Santet Segoro Pitu',
        'cinema': 'CGV Bali',
        'date': '1 November 2024',
        'time': '20.15',
        'status': 'Selesai',
        'image': 'assets/ssp.jpg',
      },
      {
        'movie': 'Shin Godzilla',
        'cinema': 'Cinepolis Bali',
        'date': '2 agustus 2024',
        'time': '13:35',
        'status': 'Selesai',
        'image': 'assets/slider2.jpeg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiket Saya'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      selectedCity: 'Jakarta', 
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

              ListView.builder(
                shrinkWrap: true, 
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          tickets[index]['image']!,
                          width: 80,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(tickets[index]['movie']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bioskop: ${tickets[index]['cinema']}'),
                          Text('Tanggal: ${tickets[index]['date']}'),
                          Text('Jam: ${tickets[index]['time']}'),
                        ],
                      ),
                      trailing: Text(
                        tickets[index]['status']!,
                        style: TextStyle(
                          color: tickets[index]['status'] == 'Aktif'
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
