import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ReusableDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final void Function(String?) onChanged;
  final String hintText;
  final String label;

  const ReusableDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.label,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF808080),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: DropdownButtonFormField2<String>(
            value: value,
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF000000)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF000000)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF000000)),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            hint: Center(
              child: Text(
                hintText,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF808080),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF000000),
              ),
              iconSize: 24,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFFFFFFF),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
      ],
    );
  }
}
