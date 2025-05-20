import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/app/app.router.dart';
import 'package:petvillage_app/models/pet_model.dart';
import 'package:petvillage_app/services/pet_detail_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  // final _petDetailService = PetDetailService();

  List<PetModel> allPets = [];
  List<PetModel> filteredPets = [];

  bool hasFilterApplied = false;

  HomeViewModel() {
    loadAllPets();
  }

  Future<void> loadAllPets() async {
    setBusy(true);
    try {
      final pets = await PetDetailService.fetchAllPets();
      allPets = pets;
      filteredPets = List.from(allPets);
      hasFilterApplied = false;
    } catch (e) {
      print('เกิดข้อผิดพลาดในการโหลดสัตว์: $e');
    }
    setBusy(false);
    notifyListeners();
  }

  Future<void> navigatetoFilter() async {
    final result = await _navigationService.navigateToHomeFilterView();

    if (result != null && result is List<dynamic>) {
      filteredPets = result.map((e) {
        if (e is PetModel) return e;
        if (e is Map<String, dynamic>) return PetModel.fromJson(e);
        throw Exception('Invalid filter result type');
      }).toList();

      hasFilterApplied = !(filteredPets.length == allPets.length &&
          _listEquals(filteredPets, allPets));

      notifyListeners();
    }
  }

  void resetFilters() {
    filteredPets = List.from(allPets);
    hasFilterApplied = false;
    notifyListeners();
  }

  bool _listEquals(List a, List b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  void navigateToPetDetail(int index) {
    _navigationService.navigateToPetDetailView(petModel: filteredPets[index]);
  }
}
