import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/data/models/cart_product.dart';

@Entity(tableName: 'cart')
class CartTable extends Equatable {
  @primaryKey
  final int id;
  final String? products;
  final int? total;
  final int? discountedTotal;
  final int? userId;
  final int? totalProducts;
  final int? totalQuantity;

  const CartTable({
    required this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'products': products,
        'total': total,
        'discountedTotal': discountedTotal,
        'userId': userId,
        'totalProducts': totalProducts,
        'totalQuantity': totalQuantity,
      };

  CartModel toModel() => CartModel(
        id: id,
        discountedTotal: discountedTotal,
        products: products
            ?.split(';')
            .map((e) =>
                CartProduct.fromJson(jsonDecode(e) as Map<String, dynamic>))
            .toList(),
        total: total,
        totalProducts: totalProducts,
        totalQuantity: totalQuantity,
        userId: userId,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      products,
      total,
      discountedTotal,
      userId,
      totalProducts,
      totalQuantity,
    ];
  }
}
