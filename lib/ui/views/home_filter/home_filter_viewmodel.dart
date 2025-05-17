import 'package:petvillage_app/services/filter_service.dart';
import 'package:stacked/stacked.dart';

class HomeFilterViewModel extends BaseViewModel {
  // ตัวเลือก
  String? selectedAnimalType;
  String? selectedBreed;
  String? selectedAge;
  String? selectedLocation;
  String? selectedDelivery;

  List<String> animalTypes = ['แมว', 'สุนัข', 'กระต่าย'];
  List<String> breeds = ['เปอร์เซีย', 'ชิสุ', 'บางแก้ว'];
  List<String> ages = ['1', '2', '3', '4', '5+'];
  List<String> locations = ['กรุงเทพ', 'เชียงใหม่', 'ขอนแก่น'];
  List<String> deliveryMethods = ['นัดรับ', 'ส่งถึงบ้าน'];

  // เพศ
  bool isBothSelected = true;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  void setAnimalType(String value) {
    selectedAnimalType = value;
    notifyListeners();
  }

  void setBreed(String value) {
    selectedBreed = value;
    notifyListeners();
  }

  void setAge(String value) {
    selectedAge = value;
    notifyListeners();
  }

  void setLocation(String value) {
    selectedLocation = value;
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
        selectedLocation != null ||
        selectedDelivery != null ||
        !isBothSelected;
  }

  void resetFilters() {
    selectedAnimalType = null;
    selectedBreed = null;
    selectedAge = null;
    selectedLocation = null;
    selectedDelivery = null;

    isMaleSelected = false;
    isFemaleSelected = false;
    isBothSelected = true;

    notifyListeners();
  }

  Future<List<dynamic>> filterPets() async {
    final result = await FilterService.filterPets(
      petType: selectedAnimalType,
      petBreed: selectedBreed,
      petAge: selectedAge != null ? int.tryParse(selectedAge!) : null,
      petGender: gender,
      petProvince: selectedLocation,
      petShipping: selectedDelivery,
    );
    return result;
  }
}
