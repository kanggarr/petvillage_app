import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthService {
  final _dialogService = locator<DialogService>();

  String? _userId;
  String? _userRole;
  String? _username;
  String? _roomId;
  String? _token;

  void setUserSession(
      {required String userId,
      required String username,
      required String? userRole,
      required String token}) {
    _userId = userId;
    _userRole = userRole;
    _username = username;
    _token = token;
  }

  void setRoomId(String roomId) {
    _roomId = roomId;
  }

  String getRoomId() {
    if (_roomId == null) throw Exception('Room ID ยังไม่ได้ถูกตั้งค่า');
    return _roomId!;
  }

  String getUserId() => _userId!;

  // get token 
  String getToken() => _token!;

  String getUserRole() => _userRole ?? 'user';

  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
    required Function onSuccess,
  }) async {
    final url = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/auth/register'
          : '${dotenv.env['API_IOS_URL']}api/auth/register',
    );
    print('🔗 Login URL: $url');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        await _dialogService.showDialog(
          title: 'สำเร็จ',
          description: data['msg'] ?? 'สร้างบัญชีผู้ใช้เรียบร้อยแล้ว',
          buttonTitle: 'ตกลง',
        );
        onSuccess();
      } else {
        await _dialogService.showDialog(
          title: 'เกิดข้อผิดพลาด',
          description: data['msg'] ?? 'ไม่สามารถลงทะเบียนได้',
          buttonTitle: 'ตกลง',
        );
      }
    } catch (e) {
      await _dialogService.showDialog(
        title: 'ข้อผิดพลาดของระบบ',
        description: 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้',
        buttonTitle: 'ตกลง',
      );
    }
  }

  Future<void> login({
    required String email,
    required String password,
    required Function onSuccess,
  }) async {
    final url = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/auth/login'
          : '${dotenv.env['API_IOS_URL']}api/auth/login',
    );
    print('🔗 Login URL: $url');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);
      print('📥 Response: $data');

      if (response.statusCode == 200) {
        final userId = data['user']['_id'];
        final username = data['user']['username'];
        final userRole = data['user']['role'];
        final token = data['token'];

        if (userId == null || username == null || token == null) {
          throw Exception('Missing userId or username or token');
        }

        // แก้ตรงนี้ให้เช็คก่อน set session
        setUserSession(
          userId: userId,
          userRole: userRole,
          username: username,
          token: token,
        );

        await _dialogService.showDialog(
          title: 'เข้าสู่ระบบสำเร็จ',
          description: 'ยินดีต้อนรับ!',
          buttonTitle: 'ตกลง',
        );
        onSuccess();
      } else if (response.statusCode == 403) {
        await _dialogService.showDialog(
          title: 'ไม่อนุญาต',
          description: data['msg'] ?? 'ยังไม่มีสิทธิ์เข้าถึง',
          buttonTitle: 'ตกลง',
        );
      } else {
        await _dialogService.showDialog(
          title: 'เกิดข้อผิดพลาด',
          description: data['msg'] ?? 'เข้าสู่ระบบไม่สำเร็จ',
          buttonTitle: 'ตกลง',
        );
      }
    } catch (e) {
      print('❌ loginUser error: $e');
      await _dialogService.showDialog(
        title: 'ข้อผิดพลาดของระบบ',
        description: 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้',
        buttonTitle: 'ตกลง',
      );
      throw e;
    }
  }

  Future<void> registerShop({
    required String shopName,
    required String email,
    required String password,
    required String address,
    required String province,
    required String district,
    required String subdistrict,
    required String imagePath,
    required Function(bool success, String? message) onResult,
  }) async {
    final url = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/auth/register/shop'
          : '${dotenv.env['API_IOS_URL']}api/auth/register/shop',
    );

    var request = http.MultipartRequest('POST', url);

    request.fields['shopName'] = shopName;
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['address'] = address;
    request.fields['shop_province'] = province;
    request.fields['shop_district'] = district;
    request.fields['shop_subdistrict'] = subdistrict;

    var file = await http.MultipartFile.fromPath(
      'businessLicense',
      imagePath,
      filename: basename(imagePath),
    );
    request.files.add(file);

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        onResult(true, null);
      } else {
        onResult(false, data['msg'] ?? 'ลงทะเบียนไม่สำเร็จ');
      }
    } catch (e) {
      onResult(false, 'เกิดข้อผิดพลาด: ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้');
    }
  }
}
