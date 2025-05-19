import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:petvillage_app/models/blog_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:http/http.dart' as http;

class BlogViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  List<BlogModel> blogs = [];

  Future<void> getBlogs() async {
    try {
      final url = Uri.parse(
        Platform.isAndroid
            ? '${dotenv.env['API_ANDROID_URL']}api/blog/'
            : '${dotenv.env['API_IOS_URL']}api/blog/',
      );

      final response = await http.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> data = jsonDecode(response.body);
        blogs = data.map((json) => BlogModel.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception(
            'ไม่สามารถดึงข้อมูลประเภทสัตว์ได้ (${response.statusCode})');
      }
    } catch (e) {
      throw Exception('เกิดข้อผิดพลาดในการเชื่อมต่อ: $e');
    }
  }

  void navigateToBlogDetail(int index) {
    _navigationService.navigateToBlogDetailView(blogModel: blogs[index]);
  }
}
