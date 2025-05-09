import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/widgets/custom_texfeild.dart';
import 'package:stacked/stacked.dart';
import 'register_viewmodel.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
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
                'สร้างบัญชี Pet Village',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF242424),
                ),
              ),
              const SizedBox(height: 30),
              // Username field
              CustomTextField(
                label: 'ชื่อผู้ใช้งาน',
                hintText: 'กรอกชื่อผู้ใช้งาน',
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

              //
            ],
          ),
        ),
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) =>
      RegisterViewModel();
}
