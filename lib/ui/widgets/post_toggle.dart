import 'package:flutter/material.dart';

class PostToggle extends StatelessWidget {
  final dynamic viewModel; // Add this line to define viewModel

  const PostToggle({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => viewModel.setCategory('บล็อก'),
              child: Container(
                decoration: BoxDecoration(
                  color: viewModel.selectedCategory == 'บล็อก'
                      ? const Color(0xFF4F9451)
                      : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'บล็อก',
                  style: TextStyle(
                      color: viewModel.selectedCategory == 'บล็อก'
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFF242424),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => viewModel.setCategory('ขาย/รับเลี้ยง'),
              child: Container(
                decoration: BoxDecoration(
                  color: viewModel.selectedCategory == 'ขาย/รับเลี้ยง'
                      ? const Color(0xFF4F9451)
                      : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'ขาย/รับเลี้ยง',
                  style: TextStyle(
                      color: viewModel.selectedCategory == 'ขาย/รับเลี้ยง'
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFF242424),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
