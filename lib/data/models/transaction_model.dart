import 'package:online_order_app/data/models/cart_item_model.dart';

class TransactionModel {
  final String id;
  final double amount;
  List<CartItemModel> products;
  final DateTime dateTime;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}
