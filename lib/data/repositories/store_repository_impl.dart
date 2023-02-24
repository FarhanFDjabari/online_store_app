import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/datasources/local/store_local_datasource.dart';
import 'package:online_order_app/data/datasources/remote/store_remote_datasource.dart';
import 'package:online_order_app/data/models/cart_list_response.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/data/models/product_list_item_response.dart';
import 'package:online_order_app/data/models/product_model.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

@LazySingleton(as: StoreRepository)
class StoreRepositoryImpl extends StoreRepository {
  final StoreRemoteDatasource _remoteDatasource;
  final StoreLocalDatasource _localDatasource;

  StoreRepositoryImpl(this._remoteDatasource, this._localDatasource);

  @override
  Future<Either<String, CartModel>> addCart(CartModel cart) async {
    try {
      final result = await _remoteDatasource.addCart(cart);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, CartListResponse>> getAllCarts() async {
    try {
      final result = await _remoteDatasource.getAllCarts();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ProductListItemResponse>> getAllProducts() async {
    try {
      final result = await _remoteDatasource.getAllProducts();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, CartModel?>> getCartById(String cartId) async {
    try {
      final result = await _remoteDatasource.getCartById(cartId);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ProductModel>> getProductById(String productId) async {
    try {
      final result = await _remoteDatasource.getProductById(productId);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, CartModel>> updateCart(CartModel cart) async {
    try {
      final result = await _remoteDatasource.updateCart(cart);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteCart(CartModel cart) async {
    try {
      await _localDatasource.deleteCart(cart.toTable());
    } catch (e) {
      return Left(e.toString());
    }

    return const Right(null);
  }

  @override
  Future<Either<String, List<CartModel>>> getAllSavedCart() async {
    try {
      final result = await _localDatasource.getAllSavedCart();
      return Right(result.map((e) => e.toModel()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, CartModel>> getSavedCartById(int cartId) async {
    try {
      final result = await _localDatasource.getSavedCartById(cartId);
      if (result != null) {
        return Right(result.toModel());
      } else {
        return const Left('Cart not found');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> saveCart(CartModel cart) async {
    try {
      await _localDatasource.saveCart(cart.toTable());
    } catch (e) {
      return Left(e.toString());
    }
    return const Right(null);
  }

  @override
  Future<Either<String, void>> updateSavedCart(CartModel cart) async {
    try {
      await _localDatasource.updateSavedCart(cart.toTable());
    } catch (e) {
      return Left(e.toString());
    }
    return const Right(null);
  }
}
