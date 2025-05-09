import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/widgets/custom_texfeild.dart';
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
                'สร้างรหัสผ่านใหม่',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF242424)),
              ),
              const SizedBox(height: 30),
              // Password Field
              CustomTextField(
                label: 'รหัสผ่านใหม่',
                hintText: 'กรอกรหัสผ่านของคุณ',
                obscureText: !viewModel.isPasswordVisible,
                onChanged: viewModel.setPassword,
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
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),
              // Confirm Password Field
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
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: viewModel.isButtonEnabled
                      ? viewModel.onConfirmPressed
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
                    'ยืนยัน',
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  ForgotPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgotPasswordViewModel();
}
