import 'dart:async';
import 'package:petvillage_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:petvillage_app/services/otp_service.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class OtpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _otpService = locator<OtpService>();

  String _otp = '';
  int _remainingTime = 60;
  Timer? _timer;
  String _email = '';

  String get otp => _otp;
  int get remainingTime => _remainingTime;
  bool get isButtonEnabled => _otp.length == 6;

  void setEmail(String email) {
    _email = email;
  }

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

  Future<void> resendOtp() async {
    await _otpService.resendOtp(email: _email);
    startTimer();
  }

  Future<void> submitOtp() async {
    await _otpService.verifyOtp(
      email: _email,
      otp: _otp,
      onSuccess: () {
        _navigationService.navigateToLoginView();
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
