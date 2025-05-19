class AnimalTypeModel {
  List<String> animalTypes;

  AnimalTypeModel({required this.animalTypes});

  factory AnimalTypeModel.fromJson(Map<String, dynamic> json) {
    return AnimalTypeModel(
      animalTypes: List<String>.from(json['animal_types'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'animal_types': List<dynamic>.from(animalTypes.map((x) => x)),
    };
  }
}