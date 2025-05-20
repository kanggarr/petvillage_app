import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:petvillage_app/services/edit_profile_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _editProfileService = EditProfileService();

  String _currentPassword = '';
  String _password = '';
  String _confirmPassword = '';

  bool _showCurrentPasswordError = false;
  bool _showPasswordError = false;
  bool _showConfirmPasswordError = false;

  bool _isCurrentPasswordVisible = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Getters
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  String get currentPassword => _currentPassword;

  bool get showCurrentPasswordError => _showCurrentPasswordError;
  bool get showPasswordError => _showPasswordError;
  bool get showConfirmPasswordError => _showConfirmPasswordError;

  bool get isCurrentPasswordVisible => _isCurrentPasswordVisible;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  bool get isButtonEnabled =>
      _currentPassword.isNotEmpty &&
      _password.isNotEmpty &&
      _confirmPassword.isNotEmpty;

  // Setters
  void setCurrentPassword(String value) {
    _currentPassword = value;
    _showCurrentPasswordError = value.isEmpty;
    notifyListeners();
  }

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

  void toggleCurrentPasswordVisibility() {
    _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
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
    _showCurrentPasswordError = _currentPassword.isEmpty;
    _showPasswordError = !isPasswordValid();
    _showConfirmPasswordError = !doPasswordsMatch();
    notifyListeners();

    if (_showCurrentPasswordError ||
        _showPasswordError ||
        _showConfirmPasswordError) {
      return;
    }

    setBusy(true);
    final token = await _getTokenFromStorage();

    final success = await _editProfileService.updatePassword(
      token: token,
      oldPassword: _currentPassword,
      newPassword: _password,
      confirmPassword: _confirmPassword,
    );

    setBusy(false);

    if (success) {
      _navigationService.back();
    } else {
      // คุณสามารถเพิ่ม Snackbar หรือ DialogService แจ้งเตือนได้ตรงนี้
      print('Password update failed');
    }
  }

  Future<String> _getTokenFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  void navigateToEditProfile() {
    _navigationService.navigateToProfileEditView();
  }
}
