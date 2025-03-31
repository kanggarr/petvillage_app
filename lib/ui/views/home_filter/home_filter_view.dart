import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Text('ตัวกรอง'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            ),
            onPressed: () {
              viewModel.navigatetoHome();
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ประเภทสัตว์เลี้ยง',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 4),
                    DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          Text(
                            'เลือกประเภทสัตว์เลี้ยง',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF808080)),
                          ),
                        ],
                      ),
                      items: [],
                      buttonStyleData: ButtonStyleData(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: const Color(0xFF000000)),
                              color: const Color(0xFFF1F1F1))),
                      iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                          ),
                          iconSize: 40),
                    )),
                    const SizedBox(height: 16),
                    const Text(
                      'พันธุ์สัตว์',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 4),
                    DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          Text(
                            'เลือกพันธุ์สัตว์เลี้ยง',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF808080)),
                          ),
                        ],
                      ),
                      items: [],
                      buttonStyleData: ButtonStyleData(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: const Color(0xFF000000)),
                              color: const Color(0xFFF1F1F1))),
                      iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                          ),
                          iconSize: 40),
                    )),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('เพศ'),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFFF1F1F1),
                              border:
                                  Border.all(color: const Color(0xFF000000)),
                            ),
                            child: const Text('ทั้งคู่',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF808080))),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFFF1F1F1),
                              border:
                                  Border.all(color: const Color(0xFF000000)),
                            ),
                            child: const Text('เพศผู้',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF808080))),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFFF1F1F1),
                              border:
                                  Border.all(color: const Color(0xFF000000)),
                            ),
                            child: const Text(
                              'เพศเมีย',
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xFF808080)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'อายุ',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 4),
                    DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          Text(
                            'เลือกอายุสัตว์',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF808080)),
                          ),
                        ],
                      ),
                      items: [],
                      buttonStyleData: ButtonStyleData(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: const Color(0xFF000000)),
                              color: const Color(0xFFF1F1F1))),
                      iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                          ),
                          iconSize: 40),
                    )),
                    const SizedBox(height: 16),
                    const Text(
                      'ที่ตั้ง',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 4),
                    DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          Text(
                            'เลือกที่ตั้ง',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF808080)),
                          ),
                        ],
                      ),
                      items: [],
                      buttonStyleData: ButtonStyleData(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: const Color(0xFF000000)),
                              color: const Color(0xFFF1F1F1))),
                      iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                          ),
                          iconSize: 40),
                    )),
                    const SizedBox(height: 16),
                    const Text(
                      'การจัดส่ง',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 4),
                    DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          Text(
                            'เลือกวิธีการจัดส่ง',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF808080)),
                          ),
                        ],
                      ),
                      items: [],
                      buttonStyleData: ButtonStyleData(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: const Color(0xFF000000)),
                              color: const Color(0xFFF1F1F1))),
                      iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                          ),
                          iconSize: 40),
                    )),
                    const SizedBox(height: 30),
                  ],
                ),
              )),
              const SizedBox(height: 30),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFFD9D9D9)),
                        child: const Text(
                          'ล้างตัวกรอง',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(
                                0xFF808080,
                              )),
                        ),
                      ),
                    )),
                    const SizedBox(width: 20),
                    Expanded(
                        child: InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFFD9D9D9)),
                        child: const Text(
                          'ค้นหา',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF808080)),
                        ),
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeFilterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeFilterViewModel();
}
