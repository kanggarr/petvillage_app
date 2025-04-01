import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/widgets/profile_dropdown_field.dart';
import 'package:petvillage_app/ui/widgets/profile_text_field.dart';
import 'package:stacked/stacked.dart';
import 'profile_edit_viewmodel.dart';

class ProfileEditView extends StackedView<ProfileEditViewModel> {
  const ProfileEditView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileEditViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: const Text("แก้ไขโปรไฟล์"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
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
            ProfileTextField(
                label: "ชื่อผู้ใช้งาน", controller: viewModel.nameController),
            ProfileTextField(
                label: "อีเมล", controller: viewModel.emailController),
            ProfileTextField(
                label: "รหัสผ่าน", controller: viewModel.phoneController),
            ProfileTextField(
                label: "ที่อยู่ปัจจุบัน",
                controller: viewModel.addressController),
            ProfileDropdownField(
              label: "จังหวัด",
              value: viewModel.selectedProvince,
              items: viewModel.provinces,
              onChanged: viewModel.setProvince,
            ),
            ProfileDropdownField(
              label: "เขต/อำเภอ",
              value: viewModel.selectedDistrice,
              items: viewModel.districts,
              onChanged: viewModel.setDistrict,
            ),
            ProfileDropdownField(
              label: "แขวง/ตำบล",
              value: viewModel.selectedSubDistrice,
              items: viewModel.subDistricts,
              onChanged: viewModel.setSubDistrict,
            ),
            ProfileTextField(
                label: "รหัสไปรษณีย์",
                controller: viewModel.postCodeController),
            ElevatedButton(
              // onPressed: viewModel.saveProfile,
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4F9451),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: const Text(
                "บันทึกข้อมูล",
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
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
