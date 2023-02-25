import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:online_order_app/data/models/cart_product.dart';

class CartProductListTypeConverter
    extends TypeConverter<List<CartProduct>, String> {
  @override
  List<CartProduct> decode(String databaseValue) {
    final jsonFile = json.decode(databaseValue);

    List<CartProduct> products = [];
    products = List.from(jsonFile['products'])
        .map((e) => CartProduct.fromJson(e))
        .toList();

    return products;
  }

  @override
  String encode(List<CartProduct> value) {
    final data = <String, dynamic>{};
    data.addAll({'products': value});
    return json.encode(data);
  }
}
