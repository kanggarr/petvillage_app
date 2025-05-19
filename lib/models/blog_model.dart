class BlogModel {
  String id;
  String titleName;
  List<String?> images;
  String description;
  String createdAt;

  BlogModel({
    required this.id,
    required this.titleName,
    required this.images,
    required this.description,
    required this.createdAt,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id']?.toString() ?? '',
      titleName: json['title_name']?.toString() ?? '',
      images: (json['images_url'] as List<dynamic>? ?? [])
          .map((e) => e?.toString())
          .toList(),
      description: json['description']?.toString() ?? '',
      createdAt: json['created_at']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title_name': titleName,
      'images_url': images,
      'description': description,
      'created_at': createdAt,
    };
  }
}
