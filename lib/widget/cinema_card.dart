import 'package:flutter/material.dart';

class CinemaCard extends StatelessWidget {
  final String name;
  final String address;
  final VoidCallback onTap;
  final String imageUrl; 

  const CinemaCard({
    super.key,
    required this.name,
    required this.address,
    required this.onTap,
    required this.imageUrl, 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(
          imageUrl,
          width: 50, 
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(address),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}