import 'package:flutter/animation.dart';

class ProductModel {
  String id;
  String name;
  String description;
  String category;
  double price;
  List<String> productSizes;
  List<Color> productColors;
  List<String>? networkImages;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    this.networkImages,
    required this.productColors,
    required this.productSizes,
  });
}
