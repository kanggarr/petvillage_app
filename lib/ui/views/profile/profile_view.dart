import 'package:flutter/material.dart';
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const ProfileHeader(),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Icons.person_outline,
                title: "แก้ไขโปรไฟล์",
                onPressed: viewModel.navigateToEditProfile,
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Icons.favorite_border,
                title: "สัตว์เลี้ยงที่ชอบ",
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Icons.notifications_outlined,
                title: "การแจ้งเตือน",
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Icons.menu_book_outlined,
                title: "คู่มือการใช้งาน",
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Icons.info_outline,
                title: "เกี่ยวกับเรา",
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Icons.phone_outlined,
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
