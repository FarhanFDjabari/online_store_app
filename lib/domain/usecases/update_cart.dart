import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/domain/entities/cart_entity.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

@lazySingleton
class UpdateCart {
  final StoreRepository _repository;

  UpdateCart(this._repository);

  Future<Either<String, CartEntity>> invoke(CartEntity cart) async {
    return _repository.updateCart(cart);
  }
}
