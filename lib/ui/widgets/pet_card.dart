import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final VoidCallback onPressed;

  const PetCard({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: const Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image, size: 40),
            SizedBox(height: 8),
            Text('...ข้อมูลเพิ่มเติม...', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
