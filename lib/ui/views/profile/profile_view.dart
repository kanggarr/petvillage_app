import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/common/assets.dart';
import 'package:petvillage_app/ui/widgets/profile_header.dart';
import 'package:petvillage_app/ui/widgets/profile_menu.dart';
import 'package:stacked/stacked.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const ProfileHeader(),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Assets.assetsIconsEditProfileIcon,
                title: "แก้ไขโปรไฟล์",
                onPressed: viewModel.navigateToEditProfile,
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Assets.assetsIconsFavoriteIcon,
                title: "สัตว์เลี้ยงที่ชอบ",
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Assets.assetsIconsNotificationIcon,
                title: "การแจ้งเตือน",
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Assets.assetsIconsUserManualIcon,
                title: "คู่มือการใช้งาน",
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Assets.assetsIconsAboutUsIcon,
                title: "เกี่ยวกับเรา",
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Assets.assetsIconsPhoneIcon,
                title: "ติดต่อเรา",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
