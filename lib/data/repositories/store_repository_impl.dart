import 'package:dartz/dartz.dart';
import 'package:online_order_app/data/datasources/local/store_local_datasource.dart';
import 'package:online_order_app/data/datasources/remote/store_remote_datasource.dart';
import 'package:online_order_app/domain/entities/product_list_item_entity.dart';
import 'package:online_order_app/domain/entities/cart_entity.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

class StoreRepositoryImpl extends StoreRepository {
  final StoreRemoteDatasource _remoteDatasource;
  final StoreLocalDatasource _localDatasource;

  StoreRepositoryImpl(this._remoteDatasource, this._localDatasource);

  @override
  Future<Either<String, CartEntity>> addCart(CartEntity cart) async {
    try {
      final result = await _remoteDatasource.addCart(cart.toModel());
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CartEntity>>> getAllCarts() async {
    try {
      final result = await _remoteDatasource.getAllCarts();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductListItemEntity>>> getAllProducts() async {
    try {
      final result = await _remoteDatasource.getAllProducts();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, CartEntity>> getCartById(String cartId) async {
    try {
      final result = await _remoteDatasource.getCartById(cartId);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ProductListItemEntity>> getProductById(
      String productId) async {
    try {
      final result = await _remoteDatasource.getProductById(productId);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, CartEntity>> updateCart(CartEntity cart) async {
    try {
      final result = await _remoteDatasource.updateCart(cart.toModel());
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteCart(CartEntity cart) async {
    try {
      await _localDatasource.deleteCart(cart.toTable());
    } catch (e) {
      return Left(e.toString());
    }

    return const Right(null);
  }

  @override
  Future<Either<String, List<CartEntity>>> getAllSavedCart() async {
    try {
      final result = await _localDatasource.getAllSavedCart();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, CartEntity>> getSavedCartById(int cartId) async {
    try {
      final result = await _localDatasource.getSavedCartById(cartId);
      if (result != null) {
        return Right(result.toEntity());
      } else {
        return const Left('Cart not found');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> saveCart(CartEntity cart) async {
    try {
      await _localDatasource.saveCart(cart.toTable());
    } catch (e) {
      return Left(e.toString());
    }
    return const Right(null);
  }

  @override
  Future<Either<String, void>> updateSavedCart(CartEntity cart) async {
    try {
      await _localDatasource.updateSavedCart(cart.toTable());
    } catch (e) {
      return Left(e.toString());
    }
    return const Right(null);
  }
}
