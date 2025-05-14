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

  // Future<void> submitLogin() async {
  //   _showEmailError = !isEmailValid;
  //   notifyListeners();

  //   if (_showEmailError) return;

  //   await _loginUser();
  // }

  // Future<void> _loginUser() async {
  //   setBusy(true);
  //   try {
  //     await _authService.loginUser(
  //       email: _email,
  //       password: _password,
  //       onSuccess: () {
  //         _navigationService.replaceWithMainView();
  //       },
  //     );
  //   } finally {
  //     setBusy(false);
  //   }
  // }

  // void navigateToRegister() {
  //   _navigationService.navigateToRegisterView();
  // }

  // void navigateToForgotPassword() {
  //   _navigationService.navigateToForgotPasswordView();
  // }

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
      await _authService.loginUser(
        email: _email,
        password: _password,
        onSuccess: () {
          loginSuccess = true;
        },
      );
    } catch (e) {
      // ลอง loginShop เฉพาะถ้า loginUser ล้มเหลว
      try {
        await _authService.loginShop(
          email: _email,
          password: _password,
          onResult: (success, message) {
            loginSuccess = success;
            if (!success) {
              locator<DialogService>().showDialog(
                title: 'เข้าสู่ระบบไม่สำเร็จ',
                description: message ?? 'ไม่สามารถเข้าสู่ระบบได้',
                buttonTitle: 'ตกลง',
              );
            }
          },
        );
      } catch (e) {
        await locator<DialogService>().showDialog(
          title: 'ข้อผิดพลาด',
          description: 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้',
          buttonTitle: 'ตกลง',
        );
      }
    }

    // ✅ ถ้า login สำเร็จจากฝั่งไหนก็แล้วแต่ → ไป main view
    if (loginSuccess) {
      _navigationService.replaceWithMainView();
    }

    setBusy(false);
  }

  void navigateToForgotPassword() {
    _navigationService.navigateToForgotPasswordView();
  }
}
