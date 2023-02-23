import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/domain/entities/product_list_item_entity.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

@lazySingleton
class GetProductById {
  final StoreRepository _repository;

  GetProductById(this._repository);

  Future<Either<String, ProductListItemEntity>> invoke(String productId) async {
    return _repository.getProductById(productId);
  }
}
