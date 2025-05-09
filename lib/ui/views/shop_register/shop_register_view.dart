import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/widgets/custom_texfeild.dart';
import 'package:petvillage_app/ui/widgets/dropdown.dart';
import 'package:petvillage_app/ui/widgets/image_picker.dart';
import 'package:stacked/stacked.dart';

import 'shop_register_viewmodel.dart';

class ShopRegisterView extends StackedView<ShopRegisterViewModel> {
  const ShopRegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ShopRegisterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(backgroundColor: const Color(0xFFF5F5F5)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'ลงทะเบียนร้านค้า',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF242424),
                ),
              ),
              const SizedBox(height: 30),
              // Username field
              CustomTextField(
                label: 'ชื่อร้านค้า/ห้างร้าน/บริษัท',
                hintText: 'กรอกชื่อร้านของคุณ',
                onChanged: viewModel.setUsername,
              ),
              const SizedBox(height: 20),
              // Email field
              CustomTextField(
                label: 'อีเมล',
                hintText: 'กรอกอีเมลของคุณ',
                onChanged: viewModel.setEmail,
                errorText: viewModel.showEmailError && !viewModel.isEmailValid()
                    ? 'รูปแบบอีเมลไม่ถูกต้อง'
                    : null,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              // Password field
              CustomTextField(
                label: 'รหัสผ่าน',
                hintText: 'กรอกรหัสผ่านของคุณ',
                onChanged: viewModel.setPassword,
                obscureText: !viewModel.isPasswordVisible,
                errorText: viewModel.showPasswordError
                    ? 'รหัสผ่านต้องมีความยาวขั้นต่ำ 6 ตัว'
                    : null,
                suffixIcon: IconButton(
                  icon: Icon(
                    viewModel.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: viewModel.togglePasswordVisibility,
                ),
              ),
              const SizedBox(height: 20),
              // Confirm Password field
              CustomTextField(
                  label: 'ยืนยันรหัสผ่าน',
                  hintText: 'ยืนยันรหัสผ่านของคุณ',
                  obscureText: !viewModel.isConfirmPasswordVisible,
                  onChanged: viewModel.setConfirmPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      viewModel.isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: viewModel.toggleConfirmPasswordVisibility,
                  ),
                  errorText: viewModel.showConfirmPasswordError
                      ? 'รหัสผ่านไม่ตรงกัน'
                      : null),
              const SizedBox(height: 20),
              // Shop location
              CustomTextField(
                label: 'ที่อยู่',
                hintText: 'กรอกที่อยู่ร้านค้า',
                onChanged: viewModel.setUsername,
              ),
              const SizedBox(height: 20),
              // Province
              ReusableDropdown(
                label: 'จังหวัด',
                hintText: 'เลือกจังหวัด',
                value: viewModel.selectedLocation,
                items: viewModel.locations,
                onChanged: (value) {
                  if (value != null) viewModel.setLocation(value);
                },
              ),
              const SizedBox(height: 20),
              // District
              ReusableDropdown(
                label: 'เขต / อำเภอ',
                hintText: 'เลือกเขต / อำเภอ',
                value: viewModel.selectedDistrict,
                items: viewModel.districts,
                onChanged: (value) {
                  if (value != null) viewModel.setDistrict(value);
                },
              ),
              const SizedBox(height: 20),
              // Sub District
              ReusableDropdown(
                label: 'แขวง / ตำบล',
                hintText: 'เลือกแขวง / ตำบล',
                value: viewModel.selectedSubDistrict,
                items: viewModel.subDistricts,
                onChanged: (value) {
                  if (value != null) viewModel.setSubDistrict(value);
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'รูปภาพ',
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF808080),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              ImagePickerWidget(onImagesChanged: (images) {
                viewModel.setImages(images
                    .map((file) => file.path)
                    .toList()); // หรือเก็บในตัวแปรใน ViewModel
              }),
              // Agree to terms checkbox
              Row(
                children: [
                  Checkbox(
                    value: viewModel.isChecked,
                    onChanged: viewModel.setChecked,
                  ),
                  const Expanded(
                    child: Text(
                      'ยินยอมตามข้อตกลงและเงื่อนไข',
                      style: TextStyle(
                        color: Color(0xFF808080),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: viewModel.isButtonEnabled
                      ? () => viewModel.onRegisterPressed()
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: viewModel.isButtonEnabled
                        ? const Color(0xFF4F9451)
                        : const Color(0xFFD9D9D9),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'ลงทะเบียน',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: viewModel.isButtonEnabled
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFF808080),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ShopRegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShopRegisterViewModel();
}
