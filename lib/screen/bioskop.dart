import 'package:flutter/material.dart';

class ListBioskop extends StatefulWidget {
  const ListBioskop({super.key});

  @override
  State<ListBioskop> createState() => _ListBioskopState();
}

class _ListBioskopState extends State<ListBioskop> {
  List<String> bioskopJakarta = [
    'AEON MALL JGC CGV',
    'AEON MALL TANJUNG BARAT XXI',
    'AGORA MALL IMAX',
    'AGORA MALL PREMIERE',
    'AGORA MALL XXI',
    'ARION XXI',
    'ARTHA GADING XXI',
    'CINEMAXX',
    'DRAKULAS XXI',
  ];

  List<String> bioskopMalang = [
    'ARAYA XXI',
    'LIPPO PLAZA BATU CINEPOLIS',
    'MALANG CITY POINT CGV',
    'MALANG TOWN SQUARE CINEPOLIS',
    'RANSMART MX MALL XXI',
    'DIENG XXI',
    'MANDALA XXI',
  ];

  List<String> bioskopSurabaya = [
    'TUNJUNGAN PLAZA XXI',
    'PAKUWON MALL XXI',
    'LENMARC CINEPOLIS',
    'CGV MASPION SQUARE',
    'PLATINUM CINEPLEX SURABAYA PLAZA',
    'GALAXY MALL XXI',
    'EAST COAST CENTER XXI (GALAXY MALL 2)',
    'CGV MARVEL CITY',
    'MOVIMAX ROYAL PLAZA',
  ];

  List<String> bioskopBali = [
    'CINEPOLIS DENPASAR (TRANS STUDIO MALL)',
    'BEACHWALK XXI (KUTA)',
    'MOVIMAX KUTA (BEACHWALK MALL)',
    'CGV CINEMAS TRANS STUDIO MALL (DENPASAR)',
    'MALL BALI GALERIA XXI (KUTA)',
    'PLATINUM CINEPLEX (KUTA)',
    'DISCOVERY MALL XXI (KUTA)',
    'CINEPOLIS KUTA (LIPPO MALL)',
    'CGV MARVEL CITY (DENPASAR)',
  ];

  List<String> bioskopBandung = [
    'PARIS VAN JAVA XXI',
    'CINEPOLIS CIHAMPELAS WALK',
    'CGV CIWALK',
    'CINEPOLIS BANDUNG SUPERMALL',
    'PLATINUM CINEPLEX BANDUNG INDAH PLAZA',
    'CGV TRANS STUDIO MALL',
    'BTC XXI',
    'TRANS STUDIO MALL BANDUNG XXI',
    'CIHAMPELAS WALK XXI',
  ];

  List<String> cities = [
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
  ];

  String selectedCity = 'Jakarta';
  List<String> filteredBioskopNames = [];

  @override
  void initState() {
    super.initState();
    filteredBioskopNames = bioskopJakarta;
  }

  void updateBioskopList() {
    setState(() {
      switch (selectedCity) {
        case 'Jakarta':
          filteredBioskopNames = bioskopJakarta;
          break;
        case 'Malang':
          filteredBioskopNames = bioskopMalang;
          break;
        case 'Surabaya':
          filteredBioskopNames = bioskopSurabaya;
          break;
        case 'Bali':
          filteredBioskopNames = bioskopBali;
          break;
        case 'Bandung':
          filteredBioskopNames = bioskopBandung;
          break;
        default:
          filteredBioskopNames = bioskopJakarta;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Cari bioskop',
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  updateBioskopList();
                } else {
                  filteredBioskopNames = filteredBioskopNames
                      .where((name) =>
                          name.toLowerCase().startsWith(value.toLowerCase()))
                      .toList();
                }
              });
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lokasi dengan Dropdown
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Color(0xFF001A4D)),
                      const SizedBox(width: 10),
                      Text(
                        selectedCity.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  DropdownButton<String>(
                    value: selectedCity,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCity = newValue!;
                        updateBioskopList();
                      });
                    },
                    items: cities.map<DropdownMenuItem<String>>((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                    underline: Container(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Penjelasan bioskop favorit
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/favoritbioskop.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tandai bioskop favoritmu!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      const Text(
                        'Bioskop favoritmu akan berada paling atas pada daftar ini dan pada jadwal film.',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: const BorderSide(
                              color: Color(0xFF001A4D),
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Text(
                          'Mengerti',
                          style: TextStyle(
                            color: Color(0xFF001A4D),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Daftar bioskop
            Expanded(
              child: ListView.builder(
                itemCount: filteredBioskopNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredBioskopNames[index]),
                    subtitle: Text(
                        'Jl. ${filteredBioskopNames[index]} , $selectedCity'),
                    leading: const Icon(Icons.movie),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
