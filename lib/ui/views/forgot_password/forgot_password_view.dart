import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'forgot_password_viewmodel.dart';

class ForgotPasswordView extends StackedView<ForgotPasswordViewModel> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgotPasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Text('เปลี่ยนรหัสผ่าน',
            style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'สร้างรหัสผ่านใหม่',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF242424)),
              ),
              const SizedBox(height: 30),

              // Current Password
              TextField(
                obscureText: !viewModel.isCurrentPasswordVisible,
                onChanged: viewModel.setCurrentPassword,
                decoration: InputDecoration(
                  labelText: 'รหัสผ่านปัจจุบัน',
                  errorText: viewModel.showCurrentPasswordError
                      ? 'กรุณากรอกรหัสผ่านปัจจุบัน'
                      : null,
                  suffixIcon: IconButton(
                    icon: Icon(viewModel.isCurrentPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: viewModel.toggleCurrentPasswordVisibility,
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // New Password
              TextField(
                obscureText: !viewModel.isPasswordVisible,
                onChanged: viewModel.setPassword,
                decoration: InputDecoration(
                  labelText: 'รหัสผ่านใหม่',
                  errorText: viewModel.showPasswordError
                      ? 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร'
                      : null,
                  suffixIcon: IconButton(
                    icon: Icon(viewModel.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: viewModel.togglePasswordVisibility,
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Confirm Password
              TextField(
                obscureText: !viewModel.isConfirmPasswordVisible,
                onChanged: viewModel.setConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'ยืนยันรหัสผ่านใหม่',
                  errorText: viewModel.showConfirmPasswordError
                      ? 'รหัสผ่านไม่ตรงกัน'
                      : null,
                  suffixIcon: IconButton(
                    icon: Icon(viewModel.isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: viewModel.toggleConfirmPasswordVisibility,
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: viewModel.isButtonEnabled
                      ? viewModel.onConfirmPressed
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F9451),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    disabledBackgroundColor: Colors.grey,
                  ),
                  child: const Text(
                    'ยืนยัน',
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
  ForgotPasswordViewModel viewModelBuilder(BuildContext context) =>
      ForgotPasswordViewModel();
}
