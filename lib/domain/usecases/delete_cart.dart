import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/domain/entities/cart_entity.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

@lazySingleton
class DeleteCart {
  final StoreRepository _repository;

  DeleteCart(this._repository);

  Future<Either<String, void>> invoke(CartEntity cart) async {
    return _repository.deleteCart(cart);
  }
}
