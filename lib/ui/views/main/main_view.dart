import 'package:flutter/material.dart';
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
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          viewModel.currentIndex = value;
        },
        currentIndex: viewModel.currentPage,
        items: List.generate(viewModel.pagesLabel.length, (index) {
          return BottomNavigationBarItem(
              icon: const Icon(Icons.abc), label: viewModel.pagesLabel[index]);
        }),
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
