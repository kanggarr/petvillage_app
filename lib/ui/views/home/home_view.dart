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
        title: const Text('สวัสดี, ผู้ใช้งาน'),
        actions: [SvgPicture.asset(Assets.assetsIconsNotificationIcon)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'ค้นหา...',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
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
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return _buildCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 24,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildCard() {
    return const Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image, size: 40),
          SizedBox(height: 8),
          Text('...ข้อมูลเพิ่มเติม...', textAlign: TextAlign.center),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
