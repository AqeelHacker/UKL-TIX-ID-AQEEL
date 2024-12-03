import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor:
              isSelected ? const Color(0xFFE0F7FF) : Colors.grey[200],
          foregroundColor: isSelected
              ? const Color(0xFF001A4D)
              : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: isSelected
                ? const BorderSide(color: Color(0xFF001A4D))
                : BorderSide.none,
          ),
        ),
        onPressed: onTap,
        child: Text(label),
      ),
    );
  }
}
