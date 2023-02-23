import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/domain/entities/cart_entity.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

@lazySingleton
class GetSavedCartById {
  final StoreRepository _repository;

  GetSavedCartById(this._repository);

  Future<Either<String, CartEntity>> invoke(int cartId) async {
    return _repository.getSavedCartById(cartId);
  }
}
