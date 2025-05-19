import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:petvillage_app/app/app.locator.dart';
import 'package:petvillage_app/constants/thai_location.dart';
import 'package:petvillage_app/services/auth_service.dart';
import 'package:petvillage_app/services/pet_detail_service.dart';
import 'package:petvillage_app/services/post_service.dart';
import 'package:stacked/stacked.dart';

class PostViewModel extends BaseViewModel {
  // userRole
  final userRole = locator<AuthService>().getUserRole();

  // post
  final postService = locator<PostService>();

  PetDetailService petDetailService = locator<PetDetailService>();

  PostViewModel() {
    blogTitleController.addListener(notifyListeners);
    blogContentController.addListener(notifyListeners);
    petNameController.addListener(notifyListeners);
  }

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

  String title = '';
  String content = '';

  // ขาย/รับเลี้ยง
  TextEditingController petNameController = TextEditingController();
  TextEditingController petDescriptionController = TextEditingController();
  TextEditingController petAge = TextEditingController();
  TextEditingController petPrice = TextEditingController();
  String? selectedAnimalType;
  String? selectedBreed;
  bool isAdopt = false;

  // ข้อมูลที่อยู่
  TextEditingController addressController = TextEditingController();
  String? selectedProvince;
  String? selectedDistrict;
  String? selectedSubDistrict;
  String? selectedDelivery;

  // รูปภาพ
  List<File> imagePaths = [];

  List<String> animalTypes = ['สุนัข', 'แมว', 'กระต่าย', 'แฮมสเตอร์'];
  List<String> breeds = [];

  final List<String> province = provinces;

  List<String> district = List<String>.from(
      districtsByProvince['กรุงเทพมหานคร'] ?? <String>[]);
  List<String> subDistrict = [];

  final List<String> deliveryMethods = ['นัดรับ', 'จัดส่งทั่วประเทศ'];

  void onChangeTitle(String? value) {
    title = value ?? '';
    notifyListeners();
  }

  void oChangeContent(String? value) {
    content = value ?? '';
    notifyListeners();
  }

  void setImages(List<File> images) {
    imagePaths = images;
    notifyListeners();
  }

  void setCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  void setBreed(String breed) {
    selectedBreed = breed;
    notifyListeners();
  }
  
  void setAdopt(bool value) {
    isAdopt = value;
    notifyListeners();
  }

  void setProvince(String province) {
  selectedProvince = province;
  district.clear();
  final newDistricts = getDistricts(province);
  district.addAll(newDistricts);
  selectedDistrict = null;
  
  subDistrict.clear();
  if (district.isNotEmpty) {
    subDistrict.addAll(getSubDistricts(district.first));
  }
  selectedSubDistrict = null;
  notifyListeners();
}

  void setDistrict(String district) {
  selectedDistrict = district;
  subDistrict.clear();
  subDistrict.addAll(getSubDistricts(district)); // ควรเช็คก่อน
  selectedSubDistrict = null;
  notifyListeners();
}

  void setSubDistrict(String subDistrict) {
    selectedSubDistrict = subDistrict;
    notifyListeners();
  }

  void setDelivery(String delivery) {
    selectedDelivery = delivery;
    notifyListeners();
  }

  void pickImage() {
    // Add Image Picker logic
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

  void createPost() async {
    if (selectedCategory == 'บล็อก') {
      final streamRes = await postService.postBlog(title, content, imagePaths);
      final res = await Response.fromStream(streamRes);

      if (res.statusCode != 201 && res.statusCode != 200) {
        throw Exception('Post failed');
      }

      final data = jsonDecode(res.body);
      debugPrint('statusCode => ${res.statusCode}');
      debugPrint('Success => $data');

    } else {
      final streamRes = await postService.postPet(
        petNameController.text,
        selectedAnimalType!,
        selectedBreed!,
        (isBothSelected ? 'ทั้งคู่' : isMaleSelected ? 'เพศผู้' : 'เพศเมีย').toString(),
        petAge.text,
        petDescriptionController.text,
        petPrice.text,
        isAdopt,
        addressController.text,
        selectedProvince!,
        selectedDistrict!,
        selectedSubDistrict!,
        selectedDelivery!,
        imagePaths,
      );
      final res = await Response.fromStream(streamRes);

      // final data = jsonDecode(res.body);
      debugPrint('statusCode => ${res.statusCode}');
      debugPrint('msg => ${res.body}');
      // debugPrint('Success => $data');

      if (res.statusCode != 201 && res.statusCode != 200) {
        throw Exception('Post failed');
      }
    }
  }

  bool get canPost {
    if (selectedCategory == 'บล็อก') {
      return blogTitleController.text.isNotEmpty &&
          imagePaths.isNotEmpty &&
          blogContentController.text.isNotEmpty;
    } else {
      return petNameController.text.isNotEmpty &&
          selectedAnimalType != null &&
          selectedBreed != null;
    }
  }

  @override
  void dispose() {
    blogTitleController.dispose();
    blogContentController.dispose();
    petNameController.dispose();
    super.dispose();
  }

  void init() async {
    
  }
}
