import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? productId;
  final int? quantity;

  const Product({this.productId, this.quantity});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json['productId'] as int?,
        quantity: json['quantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'quantity': quantity,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [productId, quantity];
}
