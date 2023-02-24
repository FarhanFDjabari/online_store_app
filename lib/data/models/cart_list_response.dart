import 'package:equatable/equatable.dart';
import 'package:online_order_app/data/models/cart_model.dart';

class CartListResponse extends Equatable {
  final List<CartModel>? carts;
  final int? total;
  final int? skip;
  final int? limit;

  const CartListResponse({this.carts, this.total, this.skip, this.limit});

  factory CartListResponse.fromJson(Map<String, dynamic> json) {
    return CartListResponse(
      carts: (json['carts'] as List<dynamic>?)
          ?.map((e) => CartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'carts': carts?.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [carts, total, skip, limit];
}
