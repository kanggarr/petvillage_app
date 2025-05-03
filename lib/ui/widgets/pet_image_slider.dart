import 'package:flutter/material.dart';

class PetImageSlider extends StatefulWidget {
  const PetImageSlider({Key? key}) : super(key: key);

  @override
  _PetImageSliderState createState() => _PetImageSliderState();
}

class _PetImageSliderState extends State<PetImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> _images = [
    'assets/images/dog.png',
    'assets/images/dog.png',
    'assets/images/dog.png',
    'assets/images/dog.png',
    'assets/images/dog.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 250,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  _images[index],
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_images.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? const Color(0xFF819979)
                    : Colors.grey.shade300,
              ),
            );
          }),
        ),
      ],
    );
  }
}
