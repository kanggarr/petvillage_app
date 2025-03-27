import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'main_viewmodel.dart';

class MainView extends StackedView<MainViewModel> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF5F5F5),
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          viewModel.currentIndex = value;
        },
        currentIndex: viewModel.currentPage,
        selectedItemColor: const Color(0xFF5F9451),
        unselectedItemColor: const Color(0xFF000000),
        showUnselectedLabels: true,
        items: List.generate(
          [
            viewModel.pagesLabel.length,
            // viewModel.pagesIcon.length,
            viewModel.pages.length
          ].reduce((a, b) => a < b ? a : b),
          (index) {
            bool isSelected = viewModel.currentPage == index;
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSelected)
                    Container(
                      width: 45,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 3),
                      decoration: const BoxDecoration(
                        color: Color(0xFF5F9451),
                      ),
                    )
                  else
                    const SizedBox(height: 8), // เว้นช่องว่างให้เท่ากัน
                  // SvgPicture.asset(
                  //   viewModel.pagesIcon[index],
                  //   // color: isSelected ? Color(0xFF5F9451) : Colors.black,s
                  //   height: 24,
                  //   width: 24,
                  // ),
                ],
              ),
              label: viewModel.pagesLabel[index],
            );
          },
        ),
      ),
      body: viewModel.pages[viewModel.currentPage],
    );
  }

  @override
  MainViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainViewModel();
}
