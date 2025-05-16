import 'package:flutter/material.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/ui/widgets/dropdown.dart';
import 'package:petvillage_app/ui/widgets/gender.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'home_filter_viewmodel.dart';

class HomeFilterView extends StackedView<HomeFilterViewModel> {
  const HomeFilterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeFilterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ตัวกรอง',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            ReusableDropdown(
              value: viewModel.selectedAnimalType,
              items: viewModel.animalTypes,
              onChanged: (value) {
                if (value != null) viewModel.setAnimalType(value);
              },
              label: 'ประเภทสัตว์เลี้ยง',
              hintText: 'เลือกประเภทสัตว์',
            ),
            const SizedBox(height: 20),
            ReusableDropdown(
              value: viewModel.selectedBreed,
              items: viewModel.breeds,
              onChanged: (value) {
                if (value != null) viewModel.setBreed(value);
              },
              label: 'พันธุ์สัตว์',
              hintText: 'เลือกพันธุ์สัตว์',
            ),
            const SizedBox(height: 20),
            const Text('เพศ',
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF808080),
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            GenderSelector(
                isBothSelected: viewModel.isBothSelected,
                isMaleSelected: viewModel.isMaleSelected,
                isFemaleSelected: viewModel.isFemaleSelected,
                setBothSelected: viewModel.setBothSelected,
                setMaleSelected: viewModel.setMaleSelected,
                setFemaleSelected: viewModel.setFemaleSelected),
            const SizedBox(height: 20),
            ReusableDropdown(
              value: viewModel.selectedAge,
              items: viewModel.ages,
              onChanged: (value) {
                if (value != null) viewModel.setAge(value);
              },
              label: 'อายุ',
              hintText: 'เลือกอายุ',
            ),
            const SizedBox(height: 20),
            ReusableDropdown(
              value: viewModel.selectedLocation,
              items: viewModel.locations,
              onChanged: (value) {
                if (value != null) viewModel.setLocation(value);
              },
              label: 'ที่ตั้ง',
              hintText: 'เลือกที่ตั้ง',
            ),
            const SizedBox(height: 20),
            ReusableDropdown(
              value: viewModel.selectedDelivery,
              items: viewModel.deliveryMethods,
              onChanged: (value) {
                if (value != null) viewModel.setDelivery(value);
              },
              label: 'การจัดส่ง',
              hintText: 'เลือกวิธีการจัดส่ง',
            ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: viewModel.hasFilter()
                          ? () {
                              viewModel.resetFilters();
                            }
                          : null,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: viewModel.hasFilter()
                              ? const Color(0xFFF18F26)
                              : const Color(0xFFD9D9D9),
                        ),
                        child: Text(
                          'ล้างตัวกรอง',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: viewModel.hasFilter()
                                ? Colors.white
                                : const Color(0xFF808080),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: InkWell(
                      onTap: viewModel.hasFilter()
                          ? () async {
                              final pets = await viewModel.filterPets();
                              print('ผลลัพธ์จาก filterPets: $pets');
                              locator<NavigationService>().back(result: pets);
                            }
                          : null,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: viewModel.hasFilter()
                              ? const Color(0xFF4F9451)
                              : const Color(0xFFD9D9D9),
                        ),
                        child: Text(
                          'ค้นหา',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: viewModel.hasFilter()
                                ? Colors.white
                                : const Color(0xFF808080),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  @override
  HomeFilterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeFilterViewModel();
}
