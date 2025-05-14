import 'package:flutter/material.dart';
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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('ยืนยันบัญชี'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'กรอกรหัสที่เราเพิ่งส่งให้คุณทาง Email:',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              maxLength: 6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, letterSpacing: 16),
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(),
              ),
              onChanged: viewModel.updateOtp,
            ),
            const SizedBox(height: 12),
            Text(
              'รหัสจะหมดอายุภายใน\n${viewModel.remainingTime}s',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed:
                  viewModel.remainingTime == 0 ? viewModel.resendOtp : null,
              child: const Text('ส่งรหัสอีกครั้ง'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: viewModel.isButtonEnabled ? viewModel.submitOtp : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'ยืนยันรหัส',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  OtpViewModel viewModelBuilder(BuildContext context) =>
      OtpViewModel()..startTimer();
}