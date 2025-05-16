import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:petvillage_app/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

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

    await _loginUserOrShop();
  }

  Future<void> _loginUserOrShop() async {
    setBusy(true);
    bool loginSuccess = false;

    try {
      print('➡️ loginUser กำลังทำงาน...');
      await _authService.loginUser(
        email: _email,
        password: _password,
        onSuccess: () {
          print('✅ loginUser สำเร็จ');
          loginSuccess = true;
        },
      );
    } catch (e) {
      print('❌ loginUser ล้มเหลว: $e');

      try {
        print('➡️ loginShop กำลังทำงาน...');
        await _authService.loginShop(
          email: _email,
          password: _password,
          onResult: (success, message) async {
            loginSuccess = success;
            print('✅ loginShop success = $success, message = $message');

            if (!success) {
              await locator<DialogService>().showDialog(
                title: 'เข้าสู่ระบบไม่สำเร็จ',
                description: message ?? 'ไม่สามารถเข้าสู่ระบบได้',
                buttonTitle: 'ตกลง',
              );
            }
          },
        );
      } catch (e) {
        print('❌ loginShop ล้มเหลว: $e');
        await locator<DialogService>().showDialog(
          title: 'ข้อผิดพลาด',
          description: 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้',
          buttonTitle: 'ตกลง',
        );
      }
    }

    if (loginSuccess) {
      _navigationService.replaceWithMainView();
    }

    setBusy(false);
  }

  void navigateToForgotPassword() {
    _navigationService.navigateToForgotPasswordView();
  }
}
