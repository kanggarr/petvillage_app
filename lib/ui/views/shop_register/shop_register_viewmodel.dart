// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart'; // Import path package for basename
import 'package:flutter/material.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:petvillage_app/constants/thai_location.dart';
import 'package:petvillage_app/services/auth_service.dart';
import 'package:petvillage_app/ui/widgets/auth_selector.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShopRegisterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _shopService = locator<AuthService>();

  String _shopname = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _address = '';
  bool _isChecked = false;
  bool _showEmailError = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // เพิ่มตัวแปรเพื่อควบคุมการแสดง errorText
  bool _showPasswordError = false;
  bool _showConfirmPasswordError = false;

  String get shopname => _shopname;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  bool get isChecked => _isChecked;
  bool get showEmailError => _showEmailError;
  bool get showPasswordError => _showPasswordError;
  bool get showConfirmPasswordError => _showConfirmPasswordError;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  // ปรับปรุงการคำนวณ isButtonEnabled
  bool get isButtonEnabled =>
      _shopname.isNotEmpty &&
      _email.isNotEmpty &&
      _address.isNotEmpty &&
      _password.isNotEmpty &&
      _confirmPassword.isNotEmpty &&
      selectedLocation != null &&
      selectedDistrict != null &&
      selectedSubDistrict != null &&
      _isChecked;

  // ที่อยู่
  String? selectedLocation;
  String? selectedDistrict;
  String? selectedSubDistrict;

  final List<String> locations = provinces;

  List<String> get districts =>
      selectedLocation != null ? getDistricts(selectedLocation!) : [];

  List<String> get subDistricts =>
      selectedDistrict != null ? getSubDistricts(selectedDistrict!) : [];

  void setLocation(String location) {
    selectedLocation = location;
    notifyListeners();
  }

  void setDistrict(String district) {
    selectedDistrict = district;
    notifyListeners();
  }

  void setSubDistrict(String subDistrict) {
    print('==> SubDistrict ที่เซต: $subDistrict (${subDistrict.runtimeType})');
    selectedSubDistrict = subDistrict;
    notifyListeners();
  }

  void setShopname(String value) {
    _shopname = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    _showEmailError = false;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  void setAddress(String value) {
    _address = value;
    notifyListeners();
  }

  void setConsentFromView() {
    _isChecked = true;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  bool isEmailValid() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(_email);
  }

  bool isPasswordValid() {
    return _password.length >= 6;
  }

  bool doPasswordsMatch() {
    return _password == _confirmPassword && _password.isNotEmpty;
  }

  Future<void> onRegisterPressed(BuildContext context) async {
    _showEmailError = !isEmailValid();
    _showPasswordError = !isPasswordValid();
    _showConfirmPasswordError = !doPasswordsMatch();
    notifyListeners();

    if (_showEmailError || _showPasswordError || _showConfirmPasswordError)
      return;

    List<String> errors = [];
    if (selectedLocation == null) errors.add('จังหวัด');
    if (selectedDistrict == null) errors.add('เขต');
    if (selectedSubDistrict == null) errors.add('แขวง');
    if (_images.isEmpty) errors.add('รูปภาพ');

    if (errors.isNotEmpty) {
      print('กรุณากรอก: ${errors.join(", ")}');
      return;
    }

    await registerShop(context); // ✅ ส่ง context มาที่นี่
  }

  void navigateToOtp() {
    _navigationService.navigateToOtpView();
  }

  void navigateToLogin() {
    _navigationService.navigateToLoginView();
  }

  List<String> _images = [];

  void setImages(List<String> images) {
    _images = images;
    notifyListeners();
  }

  List<String> get images => _images;

  Future<void> registerShop(BuildContext context) async {
    final imagePath = _images.first;

    setBusy(true);
    await _shopService.registerShop(
      shopName: _shopname,
      email: _email,
      password: _password,
      address: _address,
      province: selectedLocation!,
      district: selectedDistrict!,
      subdistrict: selectedSubDistrict!,
      imagePath: imagePath,
      onResult: (success, message) async {
        setBusy(false);
        if (success) {
          await _dialogService.showDialog(
            title: 'ลงทะเบียนสำเร็จ',
            description: 'รอการยืนยันจากแอดมิน',
            buttonTitle: 'ตกลง',
          );

          // ✅ ใช้ pushReplacement หลังจากกด "ตกลง"
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AuthSelector()),
          );
        } else {
          await _dialogService.showDialog(
            title: 'เกิดข้อผิดพลาด',
            description: message ?? 'ลงทะเบียนไม่สำเร็จ กรุณาลองใหม่',
            buttonTitle: 'ตกลง',
          );
        }
      },
    );
  }
}
