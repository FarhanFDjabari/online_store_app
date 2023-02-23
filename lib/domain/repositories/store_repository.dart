import 'package:dartz/dartz.dart';
import 'package:online_order_app/domain/entities/cart_entity.dart';
import 'package:online_order_app/domain/entities/product_list_item_entity.dart';

abstract class StoreRepository {
  Future<Either<String, List<ProductListItemEntity>>> getAllProducts();
  Future<Either<String, ProductListItemEntity>> getProductById(
    String productId,
  );
  Future<Either<String, List<CartEntity>>> getAllCarts();
  Future<Either<String, List<CartEntity>>> getAllSavedCart();
  Future<Either<String, CartEntity>> getCartById(String cartId);
  Future<Either<String, CartEntity>> getSavedCartById(int cartId);
  Future<Either<String, CartEntity>> addCart(CartEntity cart);
  Future<Either<String, CartEntity>> updateCart(CartEntity cart);
  Future<Either<String, void>> updateSavedCart(CartEntity cart);
  Future<Either<String, void>> saveCart(CartEntity cart);
  Future<Either<String, void>> deleteCart(CartEntity cart);
}
