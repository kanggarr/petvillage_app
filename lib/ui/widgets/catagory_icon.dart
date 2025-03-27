import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const CategoryIcon({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 24,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
