import 'package:online_order_app/data/models/product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel product;
  int quantity;
  double price;

  CartItemModel({
    required this.id,
    required this.quantity,
    required this.price,
    required this.product,
  });
}
