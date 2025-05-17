class PetModel {
  final String id;
  final String name;
  final String type;
  final String breed; // จาก backend เป็น id ของ breed (string)
  final String gender;
  final int age;
  final String location;
  final String delivery;
  final String image; // เก็บเป็น URL รูปแรกของ list pet_image
  final String description;
  final int price; // แก้เป็น int ตาม backend

  PetModel({
    required this.id,
    required this.name,
    required this.type,
    required this.breed,
    required this.gender,
    required this.age,
    required this.location,
    required this.delivery,
    required this.image,
    required this.description,
    required this.price,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    // ดึงรูปแรกจาก pet_image list และเติม base URL (แก้ตามจริง)
    String imageUrl = '';
    if (json['pet_image'] != null &&
        json['pet_image'] is List &&
        (json['pet_image'] as List).isNotEmpty) {
      imageUrl =
          'https://via.placeholder.com/150${(json['pet_image'] as List).first}';
    }

    return PetModel(
      id: json['_id'] ?? '',
      name: json['pet_name'] ?? '',
      type: json['pet_type'] ?? '',
      breed: json['pet_breed'] ?? '',
      gender: json['pet_gender'] ?? '',
      age: json['pet_age'] ?? 0,
      location: json['pet_address'] ?? '',
      delivery: json['pet_shipping'] ?? '',
      image: imageUrl,
      description: json['pet_description'] ?? '',
      price: json['pet_price'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'pet_name': name,
      'pet_type': type,
      'pet_breed': breed,
      'pet_gender': gender,
      'pet_age': age,
      'pet_address': location,
      'pet_shipping': delivery,
      'pet_image': [image], // แปลงกลับเป็น list มีแค่รูปเดียว
      'pet_description': description,
      'pet_price': price,
    };
  }
}
