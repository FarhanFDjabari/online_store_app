import 'package:equatable/equatable.dart';

import 'product_model.dart';

class ProductListItemResponse extends Equatable {
  final List<ProductModel>? products;
  final int? total;
  final int? skip;
  final int? limit;

  const ProductListItemResponse({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory ProductListItemResponse.fromJson(Map<String, dynamic> json) {
    return ProductListItemResponse(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [products, total, skip, limit];
}
