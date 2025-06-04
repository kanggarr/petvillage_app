import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? errorText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.onChanged,
    this.errorText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF808080),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Color(0xFF808080),
            ),
            filled: true,
            fillColor: Colors.white,
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
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            suffixIcon: suffixIcon,
            errorText: errorText,
            errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: 12,
              backgroundColor: Colors.transparent,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}
