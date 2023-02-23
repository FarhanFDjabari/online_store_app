import 'package:equatable/equatable.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/data/models/cart_table.dart';
import 'package:online_order_app/data/models/product.dart';

class CartEntity extends Equatable {
  final int? id;
  final int? userId;
  final DateTime? date;
  final List<Product>? products;
  final int? v;

  const CartEntity({this.id, this.userId, this.date, this.products, this.v});

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'date': date?.toIso8601String(),
        'products': products?.map((e) => e.toJson()).toList(),
        '__v': v,
      };

  CartTable toTable() => CartTable(
        id: id ?? 0,
        date: date?.toIso8601String(),
        products: products?.map((e) => e.toJson()).toList().join(';'),
        userId: userId,
        v: v,
      );

  CartModel toModel() => CartModel(
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
