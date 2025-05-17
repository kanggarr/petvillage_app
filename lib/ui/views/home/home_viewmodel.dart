import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<dynamic> allPets = [];
  List<dynamic> filteredPets = [];

  bool hasFilterApplied = false;

  HomeViewModel() {
    loadAllPets();
  }

  void loadAllPets() {
    allPets = [
      {
        'pet_name': 'หมา1',
        'category': 'สุนัข',
        'pet_image': ['/uploads/dog1.jpg'],
        'pet_age': 2,
        'pet_description': 'น่ารัก',
        'pet_gender': 'ผู้',
        'pet_price': 1000
      },
      {
        'pet_name': 'แมว1',
        'category': 'แมว',
        'pet_image': ['/uploads/cat1.jpg'],
        'pet_age': 1,
        'pet_description': 'ซุกซน',
        'pet_gender': 'เมีย',
        'pet_price': 1500
      },
      {
        'pet_name': 'กระต่าย1',
        'category': 'กระต่าย',
        'pet_image': ['/uploads/rabbit1.jpg'],
        'pet_age': 1,
        'pet_description': 'นุ่มนิ่ม',
        'pet_gender': 'ผู้',
        'pet_price': 800
      },
    ];

    filteredPets = List.from(allPets);
    hasFilterApplied = false;
    notifyListeners();
  }

  Future<void> navigatetoFilter() async {
    final result = await _navigationService.navigateToHomeFilterView();

    print('Filter result: $result');

    if (result != null && result is List<dynamic>) {
      filteredPets = result;

      hasFilterApplied = !(filteredPets.length == allPets.length &&
          _listEquals(filteredPets, allPets));

      notifyListeners();
    }
  }

  void resetFilters() {
    loadAllPets();
  }

  bool _listEquals(List a, List b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  void navigateToPetDetail() {
    _navigationService.navigateToPetDetailView();
  }
}
