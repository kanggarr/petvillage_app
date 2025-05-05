import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  String _email = '';
  String _password = '';
  bool _isPasswordVisible = false;
  bool _showEmailError = false;

  bool get isPasswordVisible => _isPasswordVisible;
  String get email => _email;
  String get password => _password;
  bool get showEmailError => _showEmailError;

  bool get isEmailValid =>
      _email.contains('@') && _email.contains('.') && !_email.endsWith('.');

  bool get isButtonEnabled => _email.isNotEmpty && _password.isNotEmpty;

  void setEmail(String value) {
    _email = value;
    _showEmailError = false;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> submitLogin() async {
    _showEmailError = !isEmailValid;
    notifyListeners();

    if (_showEmailError) return;

    await _loginUser();
  }

  Future<void> _loginUser() async {
    setBusy(true);
    try {
      final url = Uri.parse('http://10.0.2.2:5000/api/auth/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _email,
          'password': _password,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await _dialogService.showDialog(
          title: 'เข้าสู่ระบบสำเร็จ',
          description: 'ยินดีต้อนรับ!',
          buttonTitle: 'ตกลง',
        );
        _navigationService.replaceWithMainView();
      } else {
        await _dialogService.showDialog(
          title: 'เกิดข้อผิดพลาด',
          description: data['msg'] ?? 'เข้าสู่ระบบไม่สำเร็จ',
          buttonTitle: 'ตกลง',
        );
      }
    } catch (e) {
      await _dialogService.showDialog(
        title: 'ข้อผิดพลาดของระบบ',
        description: 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้',
        buttonTitle: 'ตกลง',
      );
    } finally {
      setBusy(false);
    }
  }

  void navigateToRegister() {
    _navigationService.navigateToRegisterView();
  }
}
