import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PostViewModel extends BaseViewModel {
  // เพศ
  bool isBothSelected = false;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  void setBothSelected() {
    isBothSelected = !isBothSelected;
    notifyListeners();
  }

  void setMaleSelected() {
    isMaleSelected = !isMaleSelected;
    notifyListeners();
  }

  void setFemaleSelected() {
    isFemaleSelected = !isFemaleSelected;
    notifyListeners();
  }

  String selectedCategory = 'บล็อก';

  // บล็อก
  final TextEditingController blogTitleController = TextEditingController();
  final TextEditingController blogContentController = TextEditingController();

  // ขาย/รับเลี้ยง
  final TextEditingController petNameController = TextEditingController();
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

  void setCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

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

  void pickImage() {
    // Add Image Picker logic
  }

  void createPost() {
    if (selectedCategory == 'บล็อก') {
      debugPrint(
          'โพสต์บล็อก: ${blogTitleController.text} - ${blogContentController.text}');
    } else {
      debugPrint(
          'โพสต์ขาย/รับเลี้ยง: ${petNameController.text} - $selectedAnimalType - $selectedBreed');
    }
  }

  bool get canPost {
    if (selectedCategory == 'บล็อก') {
      return blogTitleController.text.isNotEmpty &&
          blogContentController.text.isNotEmpty;
    } else {
      return petNameController.text.isNotEmpty &&
          selectedAnimalType != null &&
          selectedBreed != null;
    }
  }
}
