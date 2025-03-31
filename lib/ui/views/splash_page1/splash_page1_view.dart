import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'splash_page1_viewmodel.dart';

class SplashPage1View extends StackedView<SplashPage1ViewModel> {
  const SplashPage1View({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SplashPage1ViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Image.asset(
                      'assets/images/splash_page${viewModel.currentPage + 1}.png',
                      width: 350),
                ),
                const SizedBox(height: 24),
                Expanded(
                  // flex: 1,
                  child: Text(
                    viewModel.getTitle(),
                    style: const TextStyle(
                      fontSize: 24,
                      color: Color(0xFF242424),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  // flex: 2,
                  child: Text(
                    viewModel.getDescription(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF242424),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  // flex: 1,
                  child: ElevatedButton(
                    onPressed: viewModel.nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F9451),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: Text(
                      viewModel.currentPage == 3 ? 'เริ่มต้นกันเลย' : 'ถัดไป',
                      style: const TextStyle(
                          fontSize: 20, color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  // flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == viewModel.currentPage
                              ? const Color(0xFF4F9451)
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  SplashPage1ViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashPage1ViewModel();
}
