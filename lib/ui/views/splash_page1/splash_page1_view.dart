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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/splash_page${viewModel.currentPage + 1}.png',
                  width: 350,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                viewModel.getTitle(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF242424),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                viewModel.getDescription(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF242424),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FittedBox(
                child: ElevatedButton(
                  onPressed: () => viewModel.nextPage(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F9451),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(0, 50),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 16),
                  ),
                  child: Text(
                    viewModel.currentPage == 3 ? 'เริ่มต้นกันเลย' : 'ถัดไป',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  SplashPage1ViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashPage1ViewModel();
}
