import 'package:flutter/material.dart';

class CityDropdown extends StatefulWidget {
  final String selectedCity;
  final List<String> cities;
  final ValueChanged<String> onCityChanged;

  const CityDropdown({
    super.key,
    required this.selectedCity,
    required this.cities,
    required this.onCityChanged,
  });

  @override
  _CityDropdownState createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  late String _currentCity;

  @override
  void initState() {
    super.initState();
    _currentCity = widget.selectedCity; // Inisialisasi kota saat pertama kali
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _currentCity,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      underline: Container(height: 0), // Hilangkan garis bawah default
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _currentCity = newValue;
          });
          // Pastikan onCityChanged dipanggil dengan nilai baru
          widget.onCityChanged(newValue);
        }
      },
      items: widget.cities.map<DropdownMenuItem<String>>((String city) {
        return DropdownMenuItem<String>(
          value: city,
          child: Text(city),
        );
      }).toList(),
    );
  }
}
