import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart'; // Import path package for basename
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShopRegisterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  // final _dialogService = locator<DialogService>();

  String _shopname = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _address = '';
  bool _isChecked = false;
  bool _showEmailError = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // เพิ่มตัวแปรเพื่อควบคุมการแสดง errorText
  bool _showPasswordError = false;
  bool _showConfirmPasswordError = false;

  String get shopname => _shopname;
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
      _shopname.isNotEmpty &&
      _email.isNotEmpty &&
      _address.isNotEmpty &&
      _password.isNotEmpty &&
      _confirmPassword.isNotEmpty &&
      selectedLocation != null &&
      selectedDistrict != null &&
      selectedSubDistrict != null &&
      _isChecked;

  // ที่อยู่
  String? selectedLocation;
  String? selectedDistrict;
  String? selectedSubDistrict;

  // จังหวัด
  final List<String> locations = [
    "กรุงเทพมหานคร",
    "เชียงใหม่",
    "ภูเก็ต",
    "ชลบุรี",
    "อยุธยา",
    "นครราชสีมา",
    "ขอนแก่น",
    "สงขลา",
    "สุราษฎร์ธานี",
    "เชียงราย",
    "อุดรธานี",
    "สุพรรณบุรี",
    "ระยอง",
    "พิษณุโลก",
    "นครปฐม",
    "ตรัง",
    "นครศรีธรรมราช",
    "ปทุมธานี",
    "อุบลราชธานี",
    "ลำปาง",
    "สมุทรปราการ",
    "อำนาจเจริญ",
    "กาญจนบุรี",
    "สระบุรี",
    "ศรีสะเกษ",
    "สกลนคร",
    "หนองคาย",
    "ร้อยเอ็ด",
    "ตราด",
    "ลพบุรี",
    "สระแก้ว",
    "น่าน",
    "มุกดาหาร",
    "พังงา",
    "เพชรบุรี",
    "ปัตตานี",
    "นครพนม",
    "จันทบุรี",
    "กาฬสินธุ์",
    "แม่ฮ่องสอน",
    "ลำพูน",
    "อุตรดิตถ์",
    "พะเยา",
    "เลย",
    "หนองบัวลำภู",
    "มหาสารคาม",
    "ยโสธร",
    "บึงกาฬ",
    "อ่างทอง",
    "นครนายก",
    "นนทบุรี",
    "พิจิตร",
    "เพชรบูรณ์",
    "ราชบุรี",
    "สมุทรสงคราม",
    "สมุทรสาคร",
    "สิงห์บุรี",
    "สุโขทัย",
    "อุทัยธานี",
    "ฉะเชิงเทรา",
    "ปราจีนบุรี",
    "กระบี่",
    "ชุมพร",
    "นราธิวาส",
    "พัทลุง",
    "ยะลา",
    "ระนอง",
    "สตูล"
  ];

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
    print('==> SubDistrict ที่เซต: $subDistrict (${subDistrict.runtimeType})');
    selectedSubDistrict = subDistrict;
    notifyListeners();
  }

  void setShopname(String value) {
    _shopname = value;
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

  void setAddress(String value) {
    _address = value;
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

    if (_showEmailError || _showPasswordError || _showConfirmPasswordError)
      return;

    // ตรวจสอบ dropdown และรูปภาพ
    if (selectedLocation == null ||
        selectedDistrict == null ||
        selectedSubDistrict == null ||
        _images.isEmpty) {
      // คุณอาจแสดง dialog หรือ print error ตรงนี้ก็ได้
      print('กรุณากรอกจังหวัด เขต แขวง และอัปโหลดรูปภาพ');
      return;
    }

    await registerShop();
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

  Future<void> registerShop() async {
    final url = Uri.parse(
        'http://10.0.2.2:5000/api/shop/register'); // for android studio
    // final url = Uri.parse('http://localhost:5000/api/auth/register'); // for xcode

    var request = http.MultipartRequest('POST', url);

    // เพิ่มข้อมูลฟอร์ม
    request.fields['shopName'] = _shopname;
    request.fields['email'] = _email;
    request.fields['password'] = _password;
    request.fields['address'] = _address;
    request.fields['province'] = selectedLocation ?? '';
    request.fields['district'] = selectedDistrict ?? '';
    request.fields['subdistrict'] = selectedSubDistrict ?? '';

    // เพิ่มไฟล์ (business license)
    var file = await http.MultipartFile.fromPath(
      'businessLicense',
      _images.first,
      filename: basename(_images.first),
    );

    request.files.add(file);

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        var responseData = json.decode(response.body);
        print('ลงทะเบียนสำเร็จ: $responseData');
      } else {
        print('ลงทะเบียนล้มเหลว: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('เกิดข้อผิดพลาด: $e');
    }
  }
}
