import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petvillage_app/ui/common/assets.dart';
import 'package:petvillage_app/ui/widgets/catagory_icon.dart';
import 'package:petvillage_app/ui/widgets/pet_card.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(
                      'assets/images/avatar.png'), // TODO: รอเอารูปจาก database
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Smith', // TODO: รอชื่อจาก database
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'ค้นหา...',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: SvgPicture.asset(
                          Assets.assetsIconsSearchIcon,
                        ),
                      ),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    viewModel.navigatetoFilter();
                  },
                  child: SvgPicture.asset(Assets.assetsIconsFilterIcon),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.resetFilters(); // เคลียร์ค่าทั้งหมดใน ViewModel
                      _navigationService.back(
                          result: []); // ส่ง empty list กลับเพื่อบอกว่าไม่มีการกรอง
                    },
                    child: Text('ล้างตัวกรอง'),
                  )),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Builder(
                builder: (context) {
                  final baseUrl = (Platform.isAndroid
                          ? dotenv.env['API_ANDROID_URL']
                          : dotenv.env['API_IOS_URL'])
                      ?.replaceAll(RegExp(r'/$'), '');

                  if (viewModel.filteredPets.isEmpty) {
                    return const Center(
                      child: Text(
                        "ไม่พบสัตว์ที่ตรงกับตัวกรอง",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    );
                  }
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 250,
                    ),
                    itemCount: viewModel.filteredPets.length,
                    itemBuilder: (context, index) {
                      final pet = viewModel.filteredPets[index];

                      final imagePath = pet["pet_image"] != null &&
                              pet["pet_image"] is List &&
                              pet["pet_image"].isNotEmpty
                          ? pet["pet_image"][0]
                          : null;

                      final imageUrl = imagePath != null
                          ? '$baseUrl${imagePath.startsWith("/") ? imagePath : '/$imagePath'}'
                          : 'https://via.placeholder.com/150';

                      return PetCard(
                        onPressed: viewModel.navigateToPetDetail,
                        imageUrl: imageUrl,
                        name: pet["pet_name"] ?? 'ไม่ทราบชื่อ',
                        age: '${pet["pet_age"] ?? '-'} ปี',
                        breedDescription: pet["pet_description"] ?? '',
                        gender: pet["pet_gender"] ?? '',
                        price: '${pet["pet_price"] ?? '-'}',
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
