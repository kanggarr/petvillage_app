import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

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

  void submitLogin() {
    if (!isEmailValid) {
      _showEmailError = true;
      notifyListeners();
      return;
    }
  }

  void navigateToRegister() {
    _navigationService.navigateToRegisterView();
  }
}
