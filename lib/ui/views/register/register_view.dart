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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'สร้างบัญชี Pet Village',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              _buildTextField(
                context,
                label: 'ชื่อผู้ใช้งาน',
                hint: 'กรอกชื่อผู้ใช้งาน',
              ),
              const SizedBox(height: 15),
              _buildTextField(
                context,
                label: 'อีเมล',
                hint: 'กรอกอีเมลของคุณ',
              ),
              const SizedBox(height: 15),
              _buildPasswordField(
                context,
                label: 'รหัสผ่าน',
              ),
              const SizedBox(height: 15),
              _buildPasswordField(
                context,
                label: 'ยืนยันรหัสผ่าน',
              ),
              const SizedBox(height: 15),
              _buildTextField(
                context,
                label: 'เบอร์โทรศัพท์',
                hint: 'กรอกเบอร์โทรศัพท์',
              ),
              const SizedBox(height: 15),
              // Row(
              //   children: [
              //     Checkbox(
              //       value: viewModel.isTermsAccepted,
              //       onChanged: viewModel.setTermsAccepted,
              //     ),
              //     const Expanded(
              //       child: Text(
              //         'ยอมรับข้อตกลงและเงื่อนไข',
              //         style: TextStyle(fontSize: 14),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 30),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: viewModel.isFormValid ? viewModel.register : null,
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.grey,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //     ),
              //     child: const Text(
              //       'ลงทะเบียน',
              //       style: TextStyle(fontSize: 16),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(
    BuildContext context, {
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.visibility_off),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) =>
      RegisterViewModel();
}
