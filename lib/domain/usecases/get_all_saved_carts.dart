import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/domain/entities/cart_entity.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

@lazySingleton
class GetAllSavedCarts {
  final StoreRepository _repository;

  GetAllSavedCarts(this._repository);

  Future<Either<String, List<CartEntity>>> invoke() async {
    return _repository.getAllSavedCart();
  }
}
