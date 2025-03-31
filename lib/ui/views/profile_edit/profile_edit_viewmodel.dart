import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileEditViewModel extends BaseViewModel {
  final TextEditingController nameController =
      TextEditingController(text: "Smith Brown");
  final TextEditingController emailController =
      TextEditingController(text: "smith1234@gmail.com");
  final TextEditingController phoneController =
      TextEditingController(text: "089-2648925");
  final TextEditingController addressController =
      TextEditingController(text: "317/28 ช.ประชาอุทิศ45 ถ.ประชาอุทิศ");
  final TextEditingController postCodeController =
      TextEditingController(text: "10140");

  List<String> provinces = ["กรุงเทพมหานคร", "เชียงใหม่", "ภูเก็ต", "ขอนแก่น"];
  String selectedProvince = "กรุงเทพมหานคร";

  void setProvince(String province) {
    selectedProvince = province;
    notifyListeners();
  }

  List<String> districts = ["ทุ่งครุ", "บางขุนเทียน", "บางแแค", "จอมทอง"];
  String selectedDistrice = "ทุ่งครุ";

  void setDistrict(String district) {
    selectedDistrice = district;
    notifyListeners();
  }

  List<String> subDistricts = ["บางมด", "ท่าข้าม", "บางแแค", "จอมทอง"];
  String selectedSubDistrice = "บางมด";

  void setSubDistrict(String subDistrict) {
    selectedSubDistrice = subDistrict;
    notifyListeners();
  }

  // void saveProfile() {
  //   print("บันทึกข้อมูลโปรไฟล์แล้ว");
  // }
}
