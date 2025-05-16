import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  // final NavigationService _navigationService = NavigationService();

  List<dynamic> allPets = [];
  List<dynamic> filteredPets = [];

  HomeViewModel() {
    loadAllPets();
  }

  void loadAllPets() {
    allPets = [
      {
        'pet_name': 'หมา1',
        'category': 'สุนัข',
        'pet_image': [],
        'pet_age': 2,
        'pet_description': 'น่ารัก',
        'pet_gender': 'ผู้',
        'pet_price': 1000
      },
      {
        'pet_name': 'แมว1',
        'category': 'แมว',
        'pet_image': [],
        'pet_age': 1,
        'pet_description': 'ซุกซน',
        'pet_gender': 'เมีย',
        'pet_price': 1500
      },
      {
        'pet_name': 'กระต่าย1',
        'category': 'กระต่าย',
        'pet_image': [],
        'pet_age': 1,
        'pet_description': 'นุ่มนิ่ม',
        'pet_gender': 'ผู้',
        'pet_price': 800
      },
      // ข้อมูลอื่นๆ เพิ่มเติม
    ];

    // แสดงทั้งหมดโดยไม่มีการกรอง category
    filteredPets = List.from(allPets);
    notifyListeners();
  }

  Future<void> navigatetoFilter() async {
    final result = await _navigationService.navigateToHomeFilterView();

    print('Filter result: $result');

    if (result != null && result is List<dynamic>) {
      if (result.isEmpty) {
        // กรณีล้างตัวกรอง => กลับมาแสดงทั้งหมด
        loadAllPets();
      } else {
        // กรณีกรอง => ใช้ผลลัพธ์จาก filter API
        allPets = result;
        filteredPets = List.from(allPets);
        notifyListeners();
      }
    }
  }

  void resetFilters() {
    // ฟังก์ชันล้างตัวกรอง -> โหลดข้อมูลทั้งหมดใหม่
    loadAllPets();
  }

  void navigateToPetDetail() {
    _navigationService.navigateToPetDetailView();
  }
}
