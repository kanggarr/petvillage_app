import 'package:flutter/material.dart';
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
                    // Text(
                    //   'General user',
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            // GestureDetector(
            //   onTap: () {},
            //   child: SvgPicture.asset(
            //     Assets.assetsIconsNotificationIcon,
            //     width: 24,
            //     height: 24,
            //   ),
            // ),
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
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryIcon(
                      iconPath: Assets.assetsIconsPawIcon,
                      label: 'ทั้งหมด',
                      color: const Color(0xFFD4F4C4),
                    ),
                    const SizedBox(width: 32),
                    CategoryIcon(
                      iconPath: Assets.assetsIconsDogIcon,
                      label: 'สุนัข',
                      color: const Color(0xFFC89AFF),
                    ),
                    const SizedBox(width: 32),
                    CategoryIcon(
                      iconPath: Assets.assetsIconsCatIcon,
                      label: 'แมว',
                      color: const Color(0xFFA8C4F8),
                    ),
                    const SizedBox(width: 32),
                    CategoryIcon(
                      iconPath: Assets.assetsIconsRabbitIcon,
                      label: 'กระต่าย',
                      color: const Color(0xFFFFB3B3),
                    ),
                    const SizedBox(width: 32),
                    CategoryIcon(
                      iconPath: Assets.assetsIconsHamsterIcon,
                      label: 'แฮมสเตอร์',
                      color: const Color(0xFF00C26B),
                    ),
                    // const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 250, // กำหนดความสูงของแต่ละการ์ด
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return PetCard(
                    onPressed: viewModel.navigateToPetDetail,
                    imageUrl: 'assets/images/dog.png',
                    name: 'Scottish Fold Cat',
                    age: '2 เดือน',
                    breedDescription:
                        'Scottish Fold หูตั้ง เลี้ยงง่าย ขี้อ้อน ขี้เล่น กินเก่ง',
                    gender: 'ผู้',
                    price: '12,000',
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
