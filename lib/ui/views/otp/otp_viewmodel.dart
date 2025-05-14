import 'dart:async';
import 'package:stacked/stacked.dart';

class OtpViewModel extends BaseViewModel {
  String _otp = '';
  int _remainingTime = 60;
  Timer? _timer;

  String get otp => _otp;
  int get remainingTime => _remainingTime;
  bool get isButtonEnabled => _otp.length == 6;

  void updateOtp(String value) {
    _otp = value;
    notifyListeners();
  }

  void startTimer() {
    _remainingTime = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remainingTime--;
      notifyListeners();
      if (_remainingTime == 0) {
        timer.cancel();
      }
    });
  }

  void resendOtp() {
    // จำลองการส่งรหัสใหม่
    startTimer();
  }

  void submitOtp() {
    // ตรวจสอบ OTP (คุณสามารถต่อ API ได้ที่นี่)
    print('OTP ที่ป้อนคือ: $_otp');
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}