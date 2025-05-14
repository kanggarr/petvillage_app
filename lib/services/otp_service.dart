import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class OtpService {
  final _dialogService = locator<DialogService>();

  Future<void> verifyOtp({
    required String email,
    required String otp,
    required Function onSuccess,
  }) async {
    final url = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/auth/verify'
          : '${dotenv.env['API_IOS_URL']}api/auth/verify',
    );

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'otp': otp}),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        await _dialogService.showDialog(
          title: 'ยืนยันอีเมลสำเร็จ',
          description: data['msg'],
          buttonTitle: 'ตกลง',
        );
        onSuccess();
      } else {
        await _dialogService.showDialog(
          title: 'ผิดพลาด',
          description: data['msg'],
          buttonTitle: 'ตกลง',
        );
      }
    } catch (e) {
      await _dialogService.showDialog(
        title: 'ข้อผิดพลาด',
        description: 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้',
        buttonTitle: 'ตกลง',
      );
    }
  }

  Future<void> resendOtp({
    required String email,
  }) async {
    final url = Uri.parse(
      Platform.isAndroid
          ? '${dotenv.env['API_ANDROID_URL']}api/auth/resend'
          : '${dotenv.env['API_IOS_URL']}api/auth/resend',
    );

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      final data = jsonDecode(response.body);
      await _dialogService.showDialog(
        title: response.statusCode == 200 ? 'ส่ง OTP ใหม่แล้ว' : 'ผิดพลาด',
        description: data['msg'],
        buttonTitle: 'ตกลง',
      );
    } catch (e) {
      await _dialogService.showDialog(
        title: 'ข้อผิดพลาด',
        description: 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้',
        buttonTitle: 'ตกลง',
      );
    }
  }
}
