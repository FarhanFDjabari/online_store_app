import 'package:equatable/equatable.dart';
import 'package:online_order_app/data/models/cart_product_type_converter.dart';
import 'package:online_order_app/data/models/cart_table.dart';

import 'cart_product.dart';

class CartModel extends Equatable {
  final int? id;
  final List<CartProduct>? products;
  final int? total;
  final int? discountedTotal;
  final int? userId;
  final int? totalProducts;
  final int? totalQuantity;

  const CartModel({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'] as int,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
        discountedTotal: json['discountedTotal'] as int?,
        userId: json['userId'] as int?,
        totalProducts: json['totalProducts'] as int?,
        totalQuantity: json['totalQuantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'products': products?.map((e) => e.toJson()).toList(),
        'total': total,
        'discountedTotal': discountedTotal,
        'userId': userId,
        'totalProducts': totalProducts,
        'totalQuantity': totalQuantity,
      };

  Map<String, dynamic> toAddCartRequest() => {
        'userId': userId,
        'products': products?.map((e) => e.toJson()).toList(),
      };

  CartTable toTable() => CartTable(
        id: id ?? 0,
        discountedTotal: discountedTotal,
        products: CartProductListTypeConverter().encode(products ?? []),
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
