import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryIcon extends StatelessWidget {
  final String iconPath; // เปลี่ยนเป็น path ของ SVG
  final String label;
  final Color color;

  const CategoryIcon({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 32,
          child: SvgPicture.asset(iconPath, height: 35, width: 35),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
