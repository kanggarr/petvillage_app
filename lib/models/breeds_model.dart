class Breed {
  String name;
  String type;

  Breed({
    required this.name,
    required this.type,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      name: json['name'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
    };
  }
}
