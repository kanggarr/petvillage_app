import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthService {
  final _dialogService = locator<DialogService>();

  // 🔸 ตัวแปรภายในสำหรับเก็บ session ของ user หลังเข้าสู่ระบบ
  String? _userId;
  String? _roomId;

  /// 🔸 บันทึก session หลังจาก login สำเร็จ (ทั้ง userId และ roomId)
  void setUserSession({required String userId, required String roomId}) {
    _userId = userId;
    _roomId = roomId;
  }

  /// 🔸 ดึง userId ของผู้ใช้ที่ล็อกอินอยู่ (จะใช้ใน Chat หรือโปรไฟล์)
  String getUserId() => _userId!;

  /// 🔸 ดึง roomId สำหรับการใช้งานแชทของผู้ใช้
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

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // ✅ เพิ่มการดึง userId และ roomId จาก response หลัง login
        final userId = data['user']['_id'];
        final roomId = data['roomId'];

        if (userId == null || roomId == null) {
          throw Exception('Missing userId or roomId');
        }

        // ✅ เก็บ user session ไว้ในตัวแปรภายใน
        setUserSession(userId: userId, roomId: roomId);

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
      }
    } catch (e) {
      await _dialogService.showDialog(
        title: 'ข้อผิดพลาดของระบบ',
        description: 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้',
        buttonTitle: 'ตกลง',
      );
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
          : '${dotenv.env['API_IOS_URL']}/api/shop/register',
    );

    var request = http.MultipartRequest('POST', url);

    request.fields['shopName'] = shopName;
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['address'] = address;
    request.fields['province'] = province;
    request.fields['district'] = district;
    request.fields['subdistrict'] = subdistrict;

    var file = await http.MultipartFile.fromPath(
      'businessLicense',
      imagePath,
      filename: basename(imagePath),
    );
    request.files.add(file);

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        onResult(true, null);
      } else {
        final data = jsonDecode(response.body);
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
