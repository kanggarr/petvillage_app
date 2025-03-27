import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/views/blog/blog_view.dart';
import 'package:petvillage_app/ui/views/home/home_view.dart';
import 'package:petvillage_app/ui/views/message/message_view.dart';
import 'package:petvillage_app/ui/views/post/post_view.dart';
import 'package:petvillage_app/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  List<Widget> pages = [
    const HomeView(),
    const BlogView(),
    const PostView(),
    const MessageView(),
    const ProfileView()
  ];

  List<String> pagesLabel = [
    'หน้าหลัก',
    'บล็อก',
    'โพสต์',
    'ข้อความ',
    'โปรไฟล์'
  ];

  // List<String> pagesIcon = [
  //   'assets/icons/home_icon.svg',
  //   'assets/icons/blog_icon.svg',
  //   'assets/icons/post_icon.svg',
  //   'assets/icons/message_icon.svg',
  //   'assets/icons/profile_icon.svg',
  // ];

  int _currentPage = 0;

  int get currentPage => _currentPage;

  set currentIndex(int index) {
    _currentPage = index;
    notifyListeners();
  }
}
