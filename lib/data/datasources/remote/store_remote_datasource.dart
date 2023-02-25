import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/datasources/remote/api/api_service.dart';
import 'package:online_order_app/data/models/cart_list_response.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/data/models/product_list_item_response.dart';
import 'package:online_order_app/data/models/product_model.dart';

abstract class StoreRemoteDatasource {
  Future<ProductListItemResponse> getAllProducts();
  Future<CartModel> updateCart(CartModel cart);
  Future<CartModel> addCart(CartModel cart);
  Future<CartModel?> getCartById(String cartId);
  Future<CartListResponse> getAllCarts();
  Future<ProductModel> getProductById(String productId);
}

@LazySingleton(as: StoreRemoteDatasource)
class StoreRemoteDatasourceImpl extends StoreRemoteDatasource {
  final ApiServices _api;

  StoreRemoteDatasourceImpl(this._api);

  @override
  Future<ProductListItemResponse> getAllProducts() async {
    return _api.fetchAllProducts();
  }

  @override
  Future<ProductModel> getProductById(String productId) async {
    return _api.fetchProductById(productId: productId);
  }

  @override
  Future<CartListResponse> getAllCarts() async {
    return _api.fetchAllCarts();
  }

  @override
  Future<CartModel?> getCartById(String cartId) async {
    return _api.fetchCartById(cartId: cartId);
  }

  @override
  Future<CartModel> addCart(CartModel cart) async {
    return _api.postNewCart(cart: cart.toAddCartRequest());
  }

  @override
  Future<CartModel> updateCart(CartModel cart) async {
    return _api.updateCart(cartId: cart.id.toString(), cart: cart);
  }
}
