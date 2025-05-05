import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(backgroundColor: const Color(0xFFF5F5F5)),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'เข้าสู่ระบบ',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF242424)),
              ),
              const SizedBox(height: 30),
              const Text(
                'อีเมล',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF808080)),
              ),
              TextField(
                onChanged: (value) {
                  viewModel.setEmail(value);
                },
                decoration: InputDecoration(
                  hintText: 'กรอกอีเมลของคุณ',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF808080),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  errorText: viewModel.showEmailError && !viewModel.isEmailValid
                      ? 'รูปแบบอีเมลไม่ถูกต้อง'
                      : null,
                ),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
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
                    color: Color(0xFF808080),
                  ),
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
                ),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'ลืมรหัสผ่าน',
                    style: TextStyle(
                        color: Color(0xFF808080),
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      viewModel.isButtonEnabled ? viewModel.submitLogin : null,
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
                    'เข้าสู่ระบบ',
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
                    text: 'ยังไม่มีบัญชีใช่ไหม? ',
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Kanit'),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: viewModel.navigateToRegister,
                          child: const Text(
                            'สร้างบัญชี',
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
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
