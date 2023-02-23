import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/domain/entities/cart_entity.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

@lazySingleton
class GetCartById {
  final StoreRepository _repository;

  GetCartById(this._repository);

  Future<Either<String, CartEntity>> invoke(String cartId) async {
    return _repository.getCartById(cartId);
  }
}
