import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/widgets/gender.dart';
import 'package:petvillage_app/ui/widgets/image_picker.dart';

import 'dropdown.dart';

class PostAdoptForm extends StatelessWidget {
  final dynamic viewModel;

  const PostAdoptForm({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('ชื่อสัตว์เลี้ยง',
            style: TextStyle(
                fontSize: 15,
                color: Color(0xFF808080),
                fontWeight: FontWeight.w500)),
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
          child: TextField(
            controller: viewModel.petNameController,
            decoration: InputDecoration(
              hintText: 'กรอกชื่อสัตว์เลี้ยง',
              hintStyle: const TextStyle(
                fontSize: 15,
                color: Color(0xFF808080),
                fontWeight: FontWeight.normal,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF000000))),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF000000)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF000000)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text('รูปภาพ',
            style: TextStyle(
                fontSize: 15,
                color: Color(0xFF808080),
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        ImagePickerWidget(onImagesChanged: (images) {
          viewModel.setImages(images); // หรือเก็บในตัวแปรใน ViewModel
        }),
        const SizedBox(height: 20),
        const Text(
          'ประเภทสัตว์',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF808080),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        ReusableDropdown(
          value: viewModel.selectedAnimalType,
          items: viewModel.animalTypes,
          onChanged: (value) {
            if (value != null) viewModel.setAnimalType(value);
          },
          hintText: 'เลือกประเภทสัตว์',
        ),
        const SizedBox(height: 20),
        const Text('พันธุ์สัตว์',
            style: TextStyle(
                fontSize: 15,
                color: Color(0xFF808080),
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        ReusableDropdown(
          value: viewModel.selectedBreed,
          items: viewModel.breeds,
          onChanged: (value) {
            if (value != null) viewModel.setBreed(value);
          },
          hintText: 'เลือกพันธุ์สัตว์',
        ),
        const SizedBox(height: 20),
        const Text('เพศ',
            style: TextStyle(
                fontSize: 15,
                color: Color(0xFF808080),
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        GenderSelector(
            isBothSelected: viewModel.isBothSelected,
            isMaleSelected: viewModel.isMaleSelected,
            isFemaleSelected: viewModel.isFemaleSelected,
            setBothSelected: viewModel.setBothSelected,
            setMaleSelected: viewModel.setMaleSelected,
            setFemaleSelected: viewModel.setFemaleSelected),
        const SizedBox(height: 20),
        const Text('อายุ',
            style: TextStyle(
                fontSize: 15,
                color: Color(0xFF808080),
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        ReusableDropdown(
          value: viewModel.selectedAge,
          items: viewModel.ages,
          onChanged: (value) {
            if (value != null) viewModel.setAge(value);
          },
          hintText: 'เลือกอายุ',
        ),
        const SizedBox(height: 20),
        const Text('ที่ตั้ง',
            style: TextStyle(
                fontSize: 15,
                color: Color(0xFF808080),
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        ReusableDropdown(
          value: viewModel.selectedLocation,
          items: viewModel.locations,
          onChanged: (value) {
            if (value != null) viewModel.setLocation(value);
          },
          hintText: 'เลือกที่ตั้ง',
        ),
        const SizedBox(height: 20),
        const Text('การจัดส่ง',
            style: TextStyle(
                fontSize: 15,
                color: Color(0xFF808080),
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        ReusableDropdown(
          value: viewModel.selectedDelivery,
          items: viewModel.deliveryMethods,
          onChanged: (value) {
            if (value != null) viewModel.setDelivery(value);
          },
          hintText: 'เลือกวิธีการจัดส่ง',
        ),
      ],
    );
  }
}
