import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFF000000)),
      ),
      child: ListTile(
        leading: SvgPicture.asset(icon, width: 24, height: 24),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onPressed,
      ),
    );
  }
}
