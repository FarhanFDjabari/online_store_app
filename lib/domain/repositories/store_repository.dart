import 'package:dartz/dartz.dart';
import 'package:online_order_app/data/models/cart_list_response.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/data/models/product_list_item_response.dart';
import 'package:online_order_app/data/models/product_model.dart';

abstract class StoreRepository {
  Future<Either<String, ProductListItemResponse>> getAllProducts();
  Future<Either<String, ProductModel>> getProductById(
    String productId,
  );
  Future<Either<String, CartListResponse>> getAllCarts();
  Future<Either<String, List<CartModel>>> getAllSavedCart();
  Future<Either<String, CartModel?>> getCartById(String cartId);
  Future<Either<String, CartModel>> getSavedCartById(int cartId);
  Future<Either<String, CartModel>> addCart(CartModel cart);
  Future<Either<String, CartModel>> updateCart(CartModel cart);
  Future<Either<String, void>> updateSavedCart(CartModel cart);
  Future<Either<String, void>> saveCart(CartModel cart);
  Future<Either<String, void>> deleteCart(CartModel cart);
}
