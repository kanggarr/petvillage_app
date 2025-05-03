import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'สร้างบัญชี Pet Village',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF242424)),
                ),
                const SizedBox(height: 30),
                _buildTextField('ชื่อผู้ใช้งาน', 'กรอกชื่อผู้ใช้งาน',
                    viewModel.setUsername),
                _buildTextField('อีเมล', 'กรอกอีเมลของคุณ', viewModel.setEmail),
                _buildTextField(
                    'รหัสผ่าน', 'กรอกรหัสผ่านของคุณ', viewModel.setPassword,
                    obscureText: true),
                _buildTextField('ยืนยันรหัสผ่าน', 'ยืนยันรหัสผ่านของคุณ',
                    viewModel.setConfirmPassword,
                    obscureText: true),
                _buildTextField('เบอร์โทรศัพท์', 'กรอกเบอร์โทรศัพท์',
                    viewModel.setPhoneNumber),
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
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: viewModel.isChecked ? () {} : null,
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
                              : const Color(0xFF808080)),
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
                      ),
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: viewModel.navigateToLogin,
                            child: const Text(
                              'เข้าสู่ระบบ',
                              style: TextStyle(
                                color: Color(0xFF4F9451),
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
      ),
    );
  }

  Widget _buildTextField(String label, String hint, Function(String) onChanged,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF808080)),
          ),
          const SizedBox(height: 5),
          TextField(
            obscureText: obscureText,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF808080)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) =>
      RegisterViewModel();
}
