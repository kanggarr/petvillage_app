import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final VoidCallback onPressed;
  final String imageUrl;
  final String name;
  final String age;
  final String breedDescription;
  final String gender;
  final String price;

  const PetCard({
    Key? key,
    required this.onPressed,
    required this.imageUrl,
    required this.name,
    required this.age,
    required this.breedDescription,
    required this.gender,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xFF242424)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('อายุ : $age',
                  style:
                      const TextStyle(fontSize: 12, color: Color(0xFF242424))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                breedDescription,
                style: const TextStyle(fontSize: 12, color: Color(0xFF242424)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('เพศ : $gender',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xFF242424))),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                '$price Bath',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
