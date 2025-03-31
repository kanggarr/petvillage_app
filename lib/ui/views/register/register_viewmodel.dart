import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _phoneNumber = '';
  bool _isChecked = false;

  String get username => _username;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  String get phoneNumber => _phoneNumber;
  bool get isChecked => _isChecked;

  bool get isButtonEnabled =>
      _username.isNotEmpty &&
      _email.isNotEmpty &&
      _password.isNotEmpty &&
      _confirmPassword.isNotEmpty &&
      _phoneNumber.isNotEmpty &&
      _isChecked;

  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
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

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setChecked(bool? value) {
    _isChecked = value ?? false;
    notifyListeners();
  }
}
