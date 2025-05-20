import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ReusableDropdown extends StatelessWidget {
  final String? value;
  // final List<String> items;
  final List<dynamic> items;
  final void Function(String?) onChanged;
  final String hintText;
  final String label;

  const ReusableDropdown({
     Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.label,
    required this.hintText,
  }) : super(key: key);

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
          child: DropdownSearch<String>(
            items: items.cast<String>(),
            selectedItem: value,
            onChanged: onChanged,
            popupProps: PopupProps.menu(
              showSearchBox: true,
              searchFieldProps: const TextFieldProps(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'พิมพ์ชื่อเพื่อค้นหา',
                ),
              ),
              fit: FlexFit.loose,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text(item),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(25, 16, 15, 16),
                hintText: hintText,
                hintStyle: const TextStyle(
                    color: Color(0xFF808080),
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
