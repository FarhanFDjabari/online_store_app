import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/domain/entities/product_list_item_entity.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

@lazySingleton
class GetAllProducts {
  final StoreRepository _repository;

  GetAllProducts(this._repository);

  Future<Either<String, List<ProductListItemEntity>>> invoke() async {
    return _repository.getAllProducts();
  }
}
