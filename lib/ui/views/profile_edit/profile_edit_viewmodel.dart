import 'package:flutter/material.dart';
import 'package:petvillage_app/constants/thai_location.dart';
import 'package:stacked/stacked.dart';
import 'package:petvillage_app/services/edit_profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditViewModel extends BaseViewModel {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final postCodeController = TextEditingController();

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String role = 'user'; // default
  String? selectedProvince;
  String? selectedDistrict;
  String? selectedSubDistrict;

  final List<String> province = provinces;

  List<String> district =
  List<String>.from(districtsByProvince['กรุงเทพมหานคร'] ?? <String>[]);
  List<String> subDistrict = [];


  // List<String> provinces = ['กรุงเทพมหานคร', 'เชียงใหม่'];
  // List<String> districts = ['เขตบางนา', 'อำเภอเมือง'];
  // List<String> subDistricts = ['บางนาใต้', 'สุเทพ'];

  void setProvince(String province) {
    selectedProvince = province;
    district.clear();
    final newDistricts = getDistricts(province);
    district.addAll(newDistricts);
    selectedDistrict = null;

    subDistrict.clear();
    if (district.isNotEmpty) {
      subDistrict.addAll(getSubDistricts(district.first));
    }
    selectedSubDistrict = null;
    notifyListeners();
  }

  void setDistrict(String district) {
    selectedDistrict = district;
    subDistrict.clear();
    subDistrict.addAll(getSubDistricts(district)); // ควรเช็คก่อน
    selectedSubDistrict = null;
    notifyListeners();
  }

  void setSubDistrict(String subDistrict) {
    selectedSubDistrict = subDistrict;
    notifyListeners();
  }

  Future<void> init() async {
    setBusy(true);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final userRole = prefs.getString('role');

    if (userRole != null) {
      role = userRole;
    }

    if (token != null) {
      final data = await EditProfileService().fetchUserProfile(token);
      if (data != null) {
        nameController.text = data['username'] ?? '';
        emailController.text = data['email'] ?? '';
        role = data['role'] ?? 'user';
        if (role == 'shop') {
          addressController.text = data['address'] ?? '';
          postCodeController.text = data['postCode'] ?? '';
          selectedProvince = data['province'];
          selectedDistrict = data['district'];
          selectedSubDistrict = data['subDistrict'];
        }
      }
    }

    setBusy(false);
  }

  Future<void> saveProfile() async {
    setBusy(true);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      print('Token not found');
      setBusy(false);
      return;
    }

    if (role == 'shop') {
      final success = await EditProfileService().updateShopProfile(
        token: token,
        shopName: nameController.text,
        address: addressController.text,
        shopProvince: selectedProvince?? '',
        shopDistrict: selectedDistrict?? '',
        shopSubdistrict: selectedSubDistrict?? '',
        
      );

      print(success ? "อัปเดตข้อมูลร้านค้าเรียบร้อย" : "อัปเดตข้อมูลร้านค้าล้มเหลว");
    } else {
      final success = await EditProfileService().updateUsername(
        username: nameController.text,
        token: token,
      );

      print(success ? "บันทึกชื่อผู้ใช้เรียบร้อยแล้ว" : "การบันทึกชื่อผู้ใช้ล้มเหลว");
    }

    setBusy(false);
  }

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

    print(success ? "เปลี่ยนรหัสผ่านเรียบร้อยแล้ว" : "การเปลี่ยนรหัสผ่านล้มเหลว");

    if (success) {
      oldPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
    }

    setBusy(false);
  }
}
