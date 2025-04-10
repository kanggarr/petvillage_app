import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final bool isBothSelected;
  final bool isMaleSelected;
  final bool isFemaleSelected;
  final VoidCallback setBothSelected;
  final VoidCallback setMaleSelected;
  final VoidCallback setFemaleSelected;

  const GenderSelector({
    Key? key,
    required this.isBothSelected,
    required this.isMaleSelected,
    required this.isFemaleSelected,
    required this.setBothSelected,
    required this.setMaleSelected,
    required this.setFemaleSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: setBothSelected,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isBothSelected ? const Color(0xFF4F9451) : Colors.white,
                border: Border.all(color: const Color(0xFF000000)),
              ),
              child: Text(
                'ทั้งคู่',
                style: TextStyle(
                  fontSize: 15,
                  color:
                      isBothSelected ? Colors.white : const Color(0xFF808080),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: setMaleSelected,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isMaleSelected ? const Color(0xFF4F9451) : Colors.white,
                border: Border.all(color: const Color(0xFF000000)),
              ),
              child: Text(
                'เพศผู้',
                style: TextStyle(
                  fontSize: 15,
                  color:
                      isMaleSelected ? Colors.white : const Color(0xFF808080),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: setFemaleSelected,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color:
                    isFemaleSelected ? const Color(0xFF4F9451) : Colors.white,
                border: Border.all(color: const Color(0xFF000000)),
              ),
              child: Text(
                'เพศเมีย',
                style: TextStyle(
                  fontSize: 15,
                  color:
                      isFemaleSelected ? Colors.white : const Color(0xFF808080),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
