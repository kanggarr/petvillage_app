import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/widgets/custom_texfeild.dart';
import 'package:petvillage_app/ui/widgets/dropdown.dart'; // <- ใช้ ReusableDropdown
import 'package:stacked/stacked.dart';
import 'profile_edit_viewmodel.dart';
import 'package:petvillage_app/ui/views/forgot_password/forgot_password_view.dart';

class ProfileEditView extends StackedView<ProfileEditViewModel> {
  const ProfileEditView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(ProfileEditViewModel viewModel) {
    viewModel.init(); // เรียก init เมื่อ ViewModel พร้อม
  }

  @override
  Widget builder(
    BuildContext context,
    ProfileEditViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: const Text('แก้ไขโปรไฟล์', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            const SizedBox(height: 20),

            /// ชื่อผู้ใช้งาน
            CustomTextField(
              label: 'ชื่อผู้ใช้งาน',
              controller: viewModel.nameController,
            ),
            const SizedBox(height: 16),

            /// อีเมล
            CustomTextField(
              label: 'อีเมล',
              controller: viewModel.emailController,
            ),
            const SizedBox(height: 16),

            /// รหัสผ่าน (ลิงก์ไปหน้า reset)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'รหัสผ่าน',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordView(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 18),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'แก้ไขรหัสผ่านของคุณ',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.black54),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// ข้อมูลที่เฉพาะสำหรับ shop เท่านั้น
            if (viewModel.role == 'shop') ...[
              CustomTextField(
                label: 'ที่อยู่ปัจจุบัน',
                controller: viewModel.addressController,
              ),
              const SizedBox(height: 16),

              /// จังหวัด
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

              /// เขต / อำเภอ
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

              /// แขวง / ตำบล
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
            ],

            /// ปุ่มบันทึกข้อมูล
            ElevatedButton(
              onPressed: viewModel.saveProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F9451),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "บันทึกข้อมูล",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProfileEditViewModel viewModelBuilder(BuildContext context) =>
      ProfileEditViewModel();
}
