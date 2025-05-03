import 'package:stacked/stacked.dart';

class HomeFilterViewModel extends BaseViewModel {
  // เพศ
  bool isBothSelected = false;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  void setBothSelected() {
    isBothSelected = !isBothSelected;
    if (isBothSelected) {
      // ถ้าเลือกทั้งคู่ → ยกเลิกเพศผู้และเพศเมีย
      isMaleSelected = false;
      isFemaleSelected = false;
    }
    notifyListeners();
  }

  void setMaleSelected() {
    isMaleSelected = !isMaleSelected;
    if (isMaleSelected) {
      // ถ้าเลือกเพศผู้ → ยกเลิกทั้งคู่
      isBothSelected = false;
    }
    notifyListeners();
  }

  void setFemaleSelected() {
    isFemaleSelected = !isFemaleSelected;
    if (isFemaleSelected) {
      // ถ้าเลือกเพศเมีย → ยกเลิกทั้งคู่
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

  // filter

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
}
