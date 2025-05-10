import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShopRegisterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  // final _dialogService = locator<DialogService>();

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

  // ที่อยู่
  String? selectedLocation;
  String? selectedDistrict;
  String? selectedSubDistrict;

  // จังหวัด
  final List<String> locations = ['กรุงเทพฯ', 'เชียงใหม่', 'ขอนแก่น'];
  final List<String> districts = ['ทุ่งครุ', 'บางขุนเทียน', 'บางแค'];
  final List<String> subDistricts = ['บางมด', 'ท่าข้าม', 'บางบอน'];

  void setLocation(String location) {
    selectedLocation = location;
    notifyListeners();
  }

  void setDistrict(String district) {
    selectedDistrict = district;
    notifyListeners();
  }

  void setSubDistrict(String subDistrict) {
    selectedSubDistrict = subDistrict;
    notifyListeners();
  }

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

  Future<void> onRegisterPressed() async {
    _showEmailError = !isEmailValid();
    _showPasswordError = !isPasswordValid();
    _showConfirmPasswordError = !doPasswordsMatch();
    notifyListeners();

    if (_showEmailError || _showPasswordError || _showConfirmPasswordError) {
      return;
    }

    // เชื่อม backend ที่นี่
    // await registerUser();
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
}
