import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  String _email = '';
  String _password = '';

  bool get isButtonEnabled => _email.isNotEmpty && _password.isNotEmpty;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }
}
