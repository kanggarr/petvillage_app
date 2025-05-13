import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'otp_viewmodel.dart';

class OtpView extends StackedView<OtpViewModel> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(backgroundColor: const Color(0xFFF5F5F5)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'ยืนยันบัญชี',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF242424),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'กรอกรหัสที่เราเพิ่งส่งให้คุณทาง Email:',
                style: TextStyle(fontSize: 16, color: Color(0xFF808080)),
              ),
              const SizedBox(height: 36),
              PinCodeTextField(
                length: 6,
                appContext: context,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                autoFocus: true,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 64,
                  fieldWidth: 45,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  inactiveColor: const Color(0xFF808080),
                  activeColor: const Color(0xFF242424),
                  selectedColor: const Color(0xFF242424),
                ),
                enableActiveFill: true,
                textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF242424),
                ),
                onChanged: viewModel.updateOtp,
              ),
              const SizedBox(height: 36),
              Center(
                child: Column(
                  children: [
                    Text(
                      'รหัสจะหมดอายุภายใน\n${viewModel.remainingTime}s',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF808080),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: viewModel.remainingTime == 0
                          ? viewModel.resendOtp
                          : null,
                      child: const Text(
                        'ส่งรหัสอีกครั้ง',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF808080),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed:
                    viewModel.isButtonEnabled ? viewModel.submitOtp : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F9451),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  'ยืนยันรหัส',
                  style: TextStyle(
                    color: Color(0xFFF5F5F5),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  OtpViewModel viewModelBuilder(BuildContext context) {
    // ดึง email จาก ModalRoute
    final email = ModalRoute.of(context)?.settings.arguments as String;
    return OtpViewModel()
      ..setEmail(email)
      ..startTimer();
  }
}
