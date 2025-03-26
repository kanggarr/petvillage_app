import 'package:flutter/material.dart';

class PetImageSlider extends StatelessWidget {
  const PetImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          // child: Image.asset(
          //   'assets/images/dog.png',
          //   width: double.infinity,
          //   height: 200,
          //   fit: BoxFit.cover,
          // ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 0 ? Colors.black : Colors.grey.shade300,
              ),
            );
          }),
        ),
      ],
    );
  }
}
