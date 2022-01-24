import 'dart:convert';

class ProductModel {
  final String id;
  final String title;

  ProductModel({required this.id, required this.title});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(id: map["id"] ?? '', title: map["title"] ?? '');
  }
  
  String toJson() => json.encode(toMap());
  
  factory ProductModel.fromJson(String source) => ProductModel.fromJson(source);
}
