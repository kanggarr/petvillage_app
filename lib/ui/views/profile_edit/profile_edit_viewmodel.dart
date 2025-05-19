import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:petvillage_app/services/edit_profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditViewModel extends BaseViewModel {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final postCodeController = TextEditingController();

  // Controllers สำหรับการเปลี่ยนรหัสผ่าน
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> init() async {
    setBusy(true);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      final data = await EditProfileService().fetchUserProfile(token);
      if (data != null) {
        nameController.text = data['username'] ?? '';
        emailController.text = data['email'] ?? '';
        phoneController.text = data['phone'] ?? '';
        addressController.text = data['address'] ?? '';
        postCodeController.text = data['postCode'] ?? '';
      }
    }

    setBusy(false);
  }

  // ฟังก์ชันบันทึกชื่อผู้ใช้ (username)
  Future<void> saveProfile() async {
    setBusy(true);

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      print('Token not found');
      setBusy(false);
      return;
    }

    final success = await EditProfileService().updateUsername(
      username: nameController.text,
      token: token,
    );

    if (success) {
      print("บันทึกชื่อผู้ใช้เรียบร้อยแล้ว");
    } else {
      print("การบันทึกชื่อผู้ใช้ล้มเหลว");
    }

    setBusy(false);
  }

  // ฟังก์ชันเปลี่ยนรหัสผ่าน
  Future<void> updatePassword() async {
    setBusy(true);

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      print('Token not found');
      setBusy(false);
      return;
    }

    final oldPassword = oldPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    // ✅ Validation
    if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      print("กรุณากรอกข้อมูลให้ครบทุกช่อง");
      setBusy(false);
      return;
    }

    if (newPassword == oldPassword) {
      print("รหัสผ่านใหม่ต้องไม่เหมือนกับรหัสผ่านเดิม");
      setBusy(false);
      return;
    }

    if (newPassword != confirmPassword) {
      print("ยืนยันรหัสผ่านไม่ตรงกับรหัสผ่านใหม่");
      setBusy(false);
      return;
    }

    final success = await EditProfileService().updatePassword(
      token: token,
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );

    if (success) {
      print("เปลี่ยนรหัสผ่านเรียบร้อยแล้ว");
      // ล้างช่องกรอก
      oldPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
    } else {
      print("การเปลี่ยนรหัสผ่านล้มเหลว");
    }

    setBusy(false);
  }
}
