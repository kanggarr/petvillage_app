import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/constants/thai_location.dart';
import 'package:petvillage_app/services/filter_service.dart';
import 'package:petvillage_app/services/pet_detail_service.dart';
import 'package:stacked/stacked.dart';

class HomeFilterViewModel extends BaseViewModel {
  // ตัวเลือก
  String? selectedAnimalType;
  String? selectedBreed;
  String? selectedAge;
  String? selectedProvince;
  String? selectedDelivery;

  List<String> animalTypes = ['สุนัข', 'แมว', 'กระต่าย', 'แฮมสเตอร์'];
  List<String> breeds = [];
  List<String> ages = ['1', '2', '3', '4', '5+'];
  final List<String> province = provinces;
  final List<String> deliveryMethods = ['นัดรับ', 'จัดส่งทั่วประเทศ'];

  // เพศ
  bool isBothSelected = true;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  PetDetailService petDetailService = locator<PetDetailService>();

  // void setAnimalType(String value) {
  //   selectedAnimalType = value;
  //   notifyListeners();
  // }

  void setBreed(String breed) {
    selectedBreed = breed;
    notifyListeners();
  }

  void setAge(String value) {
    selectedAge = value;
    notifyListeners();
  }

  void setProvince(String province) {
    selectedProvince = province;
    notifyListeners();
  }

  void setDelivery(String value) {
    selectedDelivery = value;
    notifyListeners();
  }

  void setBothSelected() {
    isBothSelected = !isBothSelected;
    if (isBothSelected) {
      isMaleSelected = false;
      isFemaleSelected = false;
    }
    notifyListeners();
  }

  void setMaleSelected() {
    isMaleSelected = !isMaleSelected;
    if (isMaleSelected) {
      isBothSelected = false;
      isFemaleSelected = false;
    }
    notifyListeners();
  }

  void setFemaleSelected() {
    isFemaleSelected = !isFemaleSelected;
    if (isFemaleSelected) {
      isBothSelected = false;
      isMaleSelected = false;
    }
    notifyListeners();
  }

  String get gender {
    if (isMaleSelected) return 'เพศผู้';
    if (isFemaleSelected) return 'เพศเมีย';
    return 'ทั้งคู่'; // default
  }

  bool hasFilter() {
    return selectedAnimalType != null ||
        selectedBreed != null ||
        selectedAge != null ||
        selectedProvince != null ||
        selectedDelivery != null ||
        !isBothSelected;
  }

  void resetFilters() {
    selectedAnimalType = null;
    selectedBreed = null;
    selectedAge = null;
    selectedProvince = null;
    selectedDelivery = null;

    isMaleSelected = false;
    isFemaleSelected = false;
    isBothSelected = true;

    notifyListeners();
  }

  Future<void> fetchAnimalTypes() async {
    final pets = await petDetailService.getAnimalTypes();

    final set = <String>{};
    for (final pet in pets) {
      if (pet.animalTypes.isNotEmpty) {
        for (final type in pet.animalTypes) {
          set.add(type);
        }
      }
    }
    animalTypes = set.toList();
    notifyListeners();
  }

  void onSelectAnimalType(String type) {
    if (selectedAnimalType == type) return;

    selectedAnimalType = type;
    selectedBreed = null;
    breeds.clear();
    notifyListeners();

    fetchBreedsFor(type);
  }

  void onSelectBreed(String breed) {
    selectedBreed = breed;
    notifyListeners();
  }

  Future<void> fetchBreedsFor(String animalType) async {
    final breeds = await petDetailService.getBreedByType(animalType);

    final set = <String>{};
    breeds.forEach((breed) {
      if (breeds.isNotEmpty) {
        for (final b in breeds) {
          set.add(b.name);
        }
      }
    });
    this.breeds = set.toList();
    notifyListeners();
  }

  Future<List<dynamic>> filterPets() async {
    final result = await FilterService.filterPets(
      petType: selectedAnimalType,
      petBreed: selectedBreed,
      petAge: selectedAge != null ? int.tryParse(selectedAge!) : null,
      petGender: gender,
      petProvince: selectedProvince,
      petShipping: selectedDelivery,
    );
    return result;
  }
}
