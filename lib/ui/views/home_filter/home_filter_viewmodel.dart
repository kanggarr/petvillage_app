import 'package:petvillage_app/services/filter_service.dart';
import 'package:stacked/stacked.dart';

class HomeFilterViewModel extends BaseViewModel {
  // เพศ
  bool isBothSelected = false;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

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

    if (isMaleSelected && isFemaleSelected) {
      isBothSelected = true;
      isMaleSelected = false;
      isFemaleSelected = false;
    } else {
      isBothSelected = false;
    }

    notifyListeners();
  }

  void setFemaleSelected() {
    isFemaleSelected = !isFemaleSelected;

    if (isMaleSelected && isFemaleSelected) {
      isBothSelected = true;
      isMaleSelected = false;
      isFemaleSelected = false;
    } else {
      isBothSelected = false;
    }

    notifyListeners();
  }

  // ประเภทสัตว์
  String? selectedAnimalType;
  String? selectedBreed;
  String? selectedAge;
  String? selectedLocation;
  String? selectedDelivery;

  final List<String> animalTypes = ['สุนัข', 'แมว', 'กระต่าย', 'อื่น ๆ'];
  final List<String> breeds = [
    'พันธุ์ไทย',
    'พันธุ์เปอร์เซีย',
    'พันธุ์ชิสุ',
    'อื่น ๆ'
  ];

  final List<String> ages = ['น้อยกว่า 1 ปี', '1-3 ปี', 'มากกว่า 3 ปี'];
  final List<String> locations = ['กรุงเทพฯ', 'เชียงใหม่', 'ขอนแก่น'];
  final List<String> deliveryMethods = ['รับเอง', 'จัดส่งทางขนส่ง'];

  void setAnimalType(String type) {
    selectedAnimalType = type;
    notifyListeners();
  }

  void setBreed(String breed) {
    selectedBreed = breed;
    notifyListeners();
  }

  void setAge(String age) {
    selectedAge = age;
    notifyListeners();
  }

  void setLocation(String location) {
    selectedLocation = location;
    notifyListeners();
  }

  void setDelivery(String delivery) {
    selectedDelivery = delivery;
    notifyListeners();
  }

  bool hasFilter() {
    return selectedAnimalType != null ||
        selectedBreed != null ||
        selectedAge != null ||
        selectedLocation != null ||
        selectedDelivery != null ||
        isBothSelected ||
        isMaleSelected ||
        isFemaleSelected;
  }

  void resetFilters() {
    selectedAnimalType = null;
    selectedBreed = null;
    selectedAge = null;
    selectedLocation = null;
    selectedDelivery = null;

    isBothSelected = false;
    isMaleSelected = false;
    isFemaleSelected = false;

    notifyListeners();
  }

  // ฟังก์ชันเรียกใช้ filter API
  Future<List<dynamic>> filterPets() async {
    final age = selectedAge == 'น้อยกว่า 1 ปี'
        ? 0
        : selectedAge == '1-3 ปี'
            ? 2
            : selectedAge == 'มากกว่า 3 ปี'
                ? 4
                : null;

    final gender = isMaleSelected
        ? 'เพศผู้'
        : isFemaleSelected
            ? 'เพศเมีย'
            : isBothSelected
                ? 'ทั้งคู่'
                : null;

    final pets = await FilterService.filterPets(
      petType: selectedAnimalType,
      petBreed: selectedBreed,
      petGender: gender,
      petAge: age,
      petProvince: selectedLocation,
      petShipping: selectedDelivery,
    );

    return pets;
  }
}
