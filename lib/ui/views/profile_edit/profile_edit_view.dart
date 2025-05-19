import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/widgets/custom_texfeild.dart';
// import 'package:petvillage_app/ui/widgets/dropdown.dart';
// import 'package:petvillage_app/ui/widgets/profile_dropdown_field.dart';
// import 'package:petvillage_app/ui/widgets/profile_text_field.dart';
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
                label: 'ชื่อผู้ใช้งาน', controller: viewModel.nameController),
            const SizedBox(height: 16),
            CustomTextField(
                label: 'อีเมล', controller: viewModel.emailController),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'รหัสผ่าน',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
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
            //  CustomTextField(
            //      label: 'ที่อยู่ปัจุบัน',
            //      hintText: viewModel.addressController.text),
            //  const SizedBox(height: 16),
            //  ReusableDropdown(label: 'จังหวัด', hintText: '',),
            // const SizedBox(height: 16),
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
              onPressed: viewModel.saveProfile,
              // onPressed: () {},
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
