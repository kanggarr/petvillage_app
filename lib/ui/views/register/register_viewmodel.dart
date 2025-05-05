import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _isChecked = false;
  bool _showEmailError = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // เพิ่มตัวแปรเพื่อควบคุมการแสดง errorText
  bool _showPasswordError = false;
  bool _showConfirmPasswordError = false;

  String get username => _username;
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
      _username.isNotEmpty &&
      _email.isNotEmpty &&
      _password.isNotEmpty &&
      _confirmPassword.isNotEmpty &&
      _isChecked;

  void setUsername(String value) {
    _username = value;
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

  void setChecked(bool? value) {
    _isChecked = value ?? false;
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

  Future<void> onRegisterPressed() async {
    _showEmailError = !isEmailValid();
    _showPasswordError = !isPasswordValid();
    _showConfirmPasswordError = !doPasswordsMatch();
    notifyListeners();

    if (_showEmailError || _showPasswordError || _showConfirmPasswordError) {
      return;
    }

    // เชื่อม backend ที่นี่
    await registerUser();
  }

  void navigateToOtp() {
    _navigationService.navigateToOtpView();
  }

  void navigateToLogin() {
    _navigationService.navigateToLoginView();
  }

  Future<void> registerUser() async {
    print('registerUser() ถูกเรียก'); // เพิ่มการ print เพื่อตรวจสอบ
    setBusy(true); // แสดง loading ถ้ามี
    try {
      final url = Uri.parse('http://10.0.2.2:5000/api/auth/register');

      print('กำลังส่งคำขอไปที่: $url'); // เพิ่มการ print เพื่อตรวจสอบ URL
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': _username,
          'email': _email,
          'password': _password,
        }),
      );

      print(
          'Response status: ${response.statusCode}'); // ตรวจสอบสถานะการตอบกลับ
      print(
          'Response body: ${response.body}'); // ตรวจสอบเนื้อหาที่ได้รับจากเซิร์ฟเวอร์

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await _dialogService.showDialog(
          title: 'สำเร็จ',
          description: data['msg'] ?? 'สร้างบัญชีผู้ใช้เรียบร้อยแล้ว',
          buttonTitle: 'ตกลง',
        );
        navigateToOtp();
      } else {
        await _dialogService.showDialog(
          title: 'เกิดข้อผิดพลาด',
          description: data['msg'] ?? 'ไม่สามารถลงทะเบียนได้',
          buttonTitle: 'ตกลง',
        );
      }
    } catch (e) {
      print('ข้อผิดพลาด: $e'); // ตรวจสอบข้อผิดพลาด
      await _dialogService.showDialog(
        title: 'ข้อผิดพลาดของระบบ',
        description: 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้',
        buttonTitle: 'ตกลง',
      );
    } finally {
      setBusy(false);
    }
  }
}
