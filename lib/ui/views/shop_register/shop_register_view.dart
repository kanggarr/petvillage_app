import 'package:flutter/material.dart';
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
              const Text(
                'ชื่อร้านค้า/ห้างร้าน/บริษัท',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF808080)),
              ),
              TextField(
                onChanged: viewModel.setUsername,
                decoration: InputDecoration(
                  hintText: 'กรอกชื่อร้านของคุณ',
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF808080)),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                ),
              ),
              const SizedBox(height: 20),
              // Email field
              const Text(
                'อีเมล',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF808080)),
              ),
              TextField(
                onChanged: viewModel.setEmail,
                decoration: InputDecoration(
                  hintText: 'กรอกอีเมลของคุณ',
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF808080)),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  errorText:
                      viewModel.showEmailError && !viewModel.isEmailValid()
                          ? 'รูปแบบอีเมลไม่ถูกต้อง'
                          : null,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              // Password field
              const Text(
                'รหัสผ่าน',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF808080)),
              ),
              TextField(
                onChanged: viewModel.setPassword,
                obscureText: !viewModel.isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'กรอกรหัสผ่านของคุณ',
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF808080)),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  suffixIcon: IconButton(
                    icon: Icon(
                      viewModel.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: viewModel.togglePasswordVisibility,
                  ),
                  errorText: viewModel.showPasswordError
                      ? 'รหัสผ่านต้องมีความยาวขั้นต่ำ 6 ตัว'
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              // Confirm Password field
              const Text(
                'ยืนยันรหัสผ่าน',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF808080)),
              ),
              TextField(
                onChanged: viewModel.setConfirmPassword,
                obscureText: !viewModel.isConfirmPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'ยืนยันรหัสผ่านของคุณ',
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF808080)),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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
                      ? 'ยืนยันรหัสผ่านไม่ถูกต้อง'
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              // Username field
              const Text(
                'ที่อยู่ร้านค้า',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF808080)),
              ),
              TextField(
                onChanged: viewModel.setUsername,
                decoration: InputDecoration(
                  hintText: 'กรอกที่อยู่ร้านค้า',
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF808080)),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                ),
              ),
              const SizedBox(height: 20),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: viewModel.isButtonEnabled
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFF808080),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'มีบัญชีอยู่แล้วใช่ไหม? ',
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Kanit'),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: viewModel.navigateToLogin,
                          child: const Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(
                              color: Color(0xFF4F9451),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF4F9451),
                            ),
                          ),
                        ),
                      ),
                    ],
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
