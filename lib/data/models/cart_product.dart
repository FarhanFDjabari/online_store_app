import 'package:equatable/equatable.dart';

class CartProduct extends Equatable {
  final int? id;
  final String? title;
  final int? price;
  final int? quantity;
  final int? total;
  final double? discountPercentage;
  final int? discountedPrice;

  const CartProduct({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedPrice,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        id: json['id'] as int?,
        title: json['title'] as String?,
        price: json['price'] as int?,
        quantity: json['quantity'] as int?,
        total: json['total'] as int?,
        discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
        discountedPrice: json['discountedPrice'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'quantity': quantity,
        'total': total,
        'discountPercentage': discountPercentage,
        'discountedPrice': discountedPrice,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      price,
      quantity,
      total,
      discountPercentage,
      discountedPrice,
    ];
  }
}
