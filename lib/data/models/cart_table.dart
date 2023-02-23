import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:online_order_app/data/models/product.dart';
import 'package:online_order_app/domain/entities/cart_entity.dart';

@Entity(tableName: 'cart')
class CartTable extends Equatable {
  @primaryKey
  final int id;
  final int? userId;
  final String? date;
  final String? products;
  final int? v;

  const CartTable(
      {required this.id, this.userId, this.date, this.products, this.v});

  CartEntity toEntity() => CartEntity(
        id: id,
        date: DateTime.tryParse(date ?? ""),
        products: products
            ?.split(';')
            .map((e) => Product.fromJson(jsonDecode(e) as Map<String, dynamic>))
            .toList(),
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, userId, date, products, v];
}
