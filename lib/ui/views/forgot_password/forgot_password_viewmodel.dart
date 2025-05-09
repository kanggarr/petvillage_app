import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  String _password = '';
  String _confirmPassword = '';
  bool _showPasswordError = false;
  bool _showConfirmPasswordError = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  String get password => _password;
  String get confirmPassword => _confirmPassword;
  bool get showPasswordError => _showPasswordError;
  bool get showConfirmPasswordError => _showConfirmPasswordError;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  bool get isButtonEnabled =>
      _password.isNotEmpty && _confirmPassword.isNotEmpty;

  void setPassword(String value) {
    _password = value;
    _showPasswordError = !isPasswordValid();
    _showConfirmPasswordError =
        _confirmPassword.isNotEmpty && !doPasswordsMatch();
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    _showConfirmPasswordError = !doPasswordsMatch();
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

  bool isPasswordValid() {
    return _password.length >= 6;
  }

  bool doPasswordsMatch() {
    return _password == _confirmPassword && _password.isNotEmpty;
  }

  Future<void> onConfirmPressed() async {
    _showPasswordError = !isPasswordValid();
    _showConfirmPasswordError = !doPasswordsMatch();
    notifyListeners();

    if (_showPasswordError || _showConfirmPasswordError) {
      return;
    }

    // ส่งรหัสผ่านใหม่ไป backend ได้ตรงนี้
  }

  void navigateToLogin() {
    _navigationService.navigateToLoginView();
  }
}
