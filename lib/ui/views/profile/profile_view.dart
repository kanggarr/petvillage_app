import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/common/assets.dart';
import 'package:petvillage_app/ui/widgets/about_us.dart';
import 'package:petvillage_app/ui/widgets/contact_us.dart';
import 'package:petvillage_app/ui/widgets/profile_header.dart';
import 'package:petvillage_app/ui/widgets/profile_menu.dart';
import 'package:petvillage_app/ui/widgets/user_manual.dart';
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('โปรไฟล์',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
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
                onPressed: () {
                  viewModel.navigateToFavorite();
                },
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Assets.assetsIconsUserManualIcon,
                title: "คู่มือการใช้งาน",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserManual()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Assets.assetsIconsAboutUsIcon,
                title: "เกี่ยวกับเรา",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutUs()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Assets.assetsIconsPhoneIcon,
                title: "ติดต่อเรา",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactUs()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Assets.assetsIconsLogOutIcon,
                title: "ออกจากระบบ",
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
