import 'package:equatable/equatable.dart';
import 'package:online_order_app/domain/entities/cart_entity.dart';

import 'product.dart';

class CartModel extends Equatable {
  final int? id;
  final int? userId;
  final DateTime? date;
  final List<Product>? products;
  final int? v;

  const CartModel({this.id, this.userId, this.date, this.products, this.v});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'] as int?,
        userId: json['userId'] as int?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'date': date?.toIso8601String(),
        'products': products?.map((e) => e.toJson()).toList(),
        '__v': v,
      };

  CartEntity toEntity() => CartEntity(
        id: id,
        date: date,
        products: products,
        userId: userId,
        v: v,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, userId, date, products, v];
}
