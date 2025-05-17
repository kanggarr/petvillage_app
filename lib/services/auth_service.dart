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
  String? _roomId;

  void setUserSession(
      {required String userId,
      required String roomId,
      required String username}) {
    _userId = userId;
    _roomId = roomId;
  }

  String getUserId() => _userId!;

  String getRoomId() => _roomId!;

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

  Future<void> loginUser({
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
        final roomId = data['roomId']; // <-- ถ้ามีค่อยใช้งาน

        if (userId == null || username == null) {
          throw Exception('Missing userId or username');
        }

        // แก้ตรงนี้ให้เช็คก่อน set session
        setUserSession(
          userId: userId,
          roomId: roomId ?? '', // ให้เป็น '' ถ้าไม่มี
          username: username,
        );

        await _dialogService.showDialog(
          title: 'เข้าสู่ระบบสำเร็จ',
          description: 'ยินดีต้อนรับ!',
          buttonTitle: 'ตกลง',
        );
        onSuccess();
      } else {
        await _dialogService.showDialog(
          title: 'เกิดข้อผิดพลาด',
          description: data['msg'] ?? 'เข้าสู่ระบบไม่สำเร็จ',
          buttonTitle: 'ตกลง',
        );
        throw Exception(data['msg'] ?? 'เข้าสู่ระบบไม่สำเร็จ');
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
          ? '${dotenv.env['API_ANDROID_URL']}api/shop/register'
          : '${dotenv.env['API_IOS_URL']}api/shop/register',
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

  Future<void> loginShop({
    required String email,
    required String password,
    required Function(bool success, String? message) onResult,
  }) async {
    final url = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/shop/login'
          : '${dotenv.env['API_IOS_URL']}api/shop/login',
    );

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await _dialogService.showDialog(
          title: 'เข้าสู่ระบบร้านค้าสำเร็จ',
          description: 'ยินดีต้อนรับร้านค้า ${data['shop']['shopName']}',
          buttonTitle: 'ตกลง',
        );
        onResult(true, null);
      } else {
        onResult(false, data['msg'] ?? 'เข้าสู่ระบบไม่สำเร็จ');
      }
    } catch (e) {
      onResult(false, 'เกิดข้อผิดพลาด: ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้');
    }
  }
}
