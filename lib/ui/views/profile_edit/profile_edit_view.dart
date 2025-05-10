import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/widgets/custom_texfeild.dart';
import 'package:petvillage_app/ui/widgets/dropdown.dart';
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
            CustomTextField(
                label: 'ชื่อผู้ใช้งาน',
                hintText: viewModel.nameController.text),
            const SizedBox(height: 16),
            CustomTextField(
                label: 'อีเมล', hintText: viewModel.emailController.text),
            const SizedBox(height: 16),
            CustomTextField(label: 'รหัสผ่าน', hintText: 'แก้ไขรหัสผ่าน'),
            const SizedBox(height: 16),
            CustomTextField(
                label: 'ที่อยู่ปัจุบัน',
                hintText: viewModel.addressController.text),
            const SizedBox(height: 16),
            // ReusableDropdown(label: 'จังหวัด', hintText: '',),
            const SizedBox(height: 16),
            // ProfileDropdownField(
            //   label: "จังหวัด",
            //   value: viewModel.selectedProvince,
            //   items: viewModel.provinces,
            //   onChanged: viewModel.setProvince,
            // ),
            // ProfileDropdownField(
            //   label: "เขต/อำเภอ",
            //   value: viewModel.selectedDistrice,
            //   items: viewModel.districts,
            //   onChanged: viewModel.setDistrict,
            // ),
            // ProfileDropdownField(
            //   label: "แขวง/ตำบล",
            //   value: viewModel.selectedSubDistrice,
            //   items: viewModel.subDistricts,
            //   onChanged: viewModel.setSubDistrict,
            // ),
            // ProfileTextField(
            //     label: "รหัสไปรษณีย์",
            //     controller: viewModel.postCodeController),
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
