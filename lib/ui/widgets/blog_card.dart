import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final VoidCallback onPressed;

  const BlogCard({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.image, size: 40),
            const SizedBox(height: 8),
            const Text('...ข้อมูลเพิ่มเติม...', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
