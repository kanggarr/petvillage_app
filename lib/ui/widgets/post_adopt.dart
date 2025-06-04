import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/views/post/post_viewmodel.dart';
import 'package:petvillage_app/ui/widgets/gender.dart';
import 'package:petvillage_app/ui/widgets/image_picker.dart';

import 'dropdown.dart';

class PostAdoptForm extends StatelessWidget {
  final PostViewModel viewModel;

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
        // const Text(
        //   'ประเภทสัตว์',
        //   style: TextStyle(
        //     fontSize: 15,
        //     color: Color(0xFF808080),
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        // const SizedBox(height: 5),
        ReusableDropdown(
          value: viewModel.selectedAnimalType,
          items: viewModel.animalTypes,
          onChanged: (value) {
            if (value != null) viewModel.onSelectAnimalType(value);
          },
          label: 'ประเภทสัตว์',
          hintText: 'เลือกประเภทสัตว์',
        ),
        const SizedBox(height: 20),
        // const Text('พันธุ์สัตว์',
        //     style: TextStyle(
        //         fontSize: 15,
        //         color: Color(0xFF808080),
        //         fontWeight: FontWeight.w500)),
        // const SizedBox(height: 5),
        ReusableDropdown(
          value: viewModel.selectedBreed,
          items: viewModel.breeds,
          onChanged: (value) {
            if (value != null) viewModel.onSelectBreed(value);
          },
          label: 'พันธุ์สัตว์',
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
        // const Text('อายุ',
        //     style: TextStyle(
        //         fontSize: 15,
        //         color: Color(0xFF808080),
        //         fontWeight: FontWeight.w500)),
        // const SizedBox(height: 5),
        const Text(
          'อายุ',
          style: TextStyle(
              fontSize: 15,
              color: Color(0xFF808080),
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: viewModel.petAge,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: 'กรอกอายุ.',
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
              fillColor: Colors.white),
          onChanged: viewModel.oChangeContent,
        ),
        const SizedBox(height: 20),
        const Text(
          'รายละเอียด',
          style: TextStyle(
              fontSize: 15,
              color: Color(0xFF808080),
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: viewModel.petDescriptionController,
          maxLines: 5,
          decoration: InputDecoration(
              hintText: 'พิมพ์ข้อความ...',
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
              fillColor: Colors.white),
          onChanged: viewModel.oChangeContent,
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ราคา',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF808080),
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: viewModel.petPrice,
                    decoration: InputDecoration(
                        hintText: 'กรอกราคา',
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF808080),
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Color(0xFF000000))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xFF000000)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xFF000000)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 16),
                        filled: true,
                        fillColor: Colors.white),
                    onChanged: viewModel.oChangeContent,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Row(
                    children: [
                      Text('หาบ้านให้สัตว์เลี้ยง',
                          style: TextStyle(
                              fontSize: 15,
                              color: const Color(0xFF808080).withOpacity(0.5),
                              fontWeight: FontWeight.w500)),
                      Checkbox(
                        value: viewModel.isAdopt,
                        onChanged: (value) {
                          if (value != null) {
                            viewModel.setAdopt(value);
                          }
                        },
                        activeColor: const Color(0xFF4F9451),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        // const Text('ที่ตั้ง',
        //     style: TextStyle(
        //         fontSize: 15,
        //         color: Color(0xFF808080),
        //         fontWeight: FontWeight.w500)),
        // const SizedBox(height: 5),
        const Text('ที่อยู่',
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
            controller: viewModel.addressController,
            decoration: InputDecoration(
              hintText: 'ที่อยู่',
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
        ReusableDropdown(
          value: viewModel.selectedProvince,
          items: viewModel.province,
          onChanged: (value) {
            if (value != null) viewModel.setProvince(value);
          },
          label: 'จังหวัด',
          hintText: 'เลือกจังหวัด',
        ),
        const SizedBox(height: 20),
        ReusableDropdown(
          value: viewModel.selectedDistrict,
          items: viewModel.district,
          onChanged: (value) {
            if (value != null) viewModel.setDistrict(value);
          },
          label: 'เขต / อำเภอ',
          hintText: 'เลือกเขต / อำเภอ',
        ),
        const SizedBox(height: 20),
        ReusableDropdown(
          value: viewModel.selectedSubDistrict,
          items: viewModel.subDistrict,
          onChanged: (value) {
            if (value != null) viewModel.setSubDistrict(value);
          },
          label: 'แขวง / ตำบล',
          hintText: 'เลือกแขวง / ตำบล',
        ),
        const SizedBox(height: 20),
        // const Text('การจัดส่ง',
        //     style: TextStyle(
        //         fontSize: 15,
        //         color: Color(0xFF808080),
        //         fontWeight: FontWeight.w500)),
        // const SizedBox(height: 5),
        ReusableDropdown(
          value: viewModel.selectedDelivery,
          items: viewModel.deliveryMethods,
          onChanged: (value) {
            if (value != null) viewModel.setDelivery(value);
          },
          label: 'การจัดส่ง',
          hintText: 'เลือกวิธีการจัดส่ง',
        ),
      ],
    );
  }
}
