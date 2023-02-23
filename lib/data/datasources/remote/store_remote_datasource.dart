import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/datasources/remote/api/api_service.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/data/models/product_list_item_model.dart';

@lazySingleton
class StoreRemoteDatasource {
  final ApiServices _api;

  StoreRemoteDatasource(this._api);

  Future<List<ProductListItemModel>> getAllProducts() async {
    return _api.fetchAllProducts();
  }

  Future<ProductListItemModel> getProductById(String productId) async {
    return _api.fetchProductById(productId: productId);
  }

  Future<List<CartModel>> getAllCarts() async {
    return _api.fetchAllCarts();
  }

  Future<CartModel> getCartById(String cartId) async {
    return _api.fetchCartById(cartId: cartId);
  }

  Future<CartModel> addCart(CartModel cart) async {
    return _api.postNewCart(cart: cart);
  }

  Future<CartModel> updateCart(CartModel cart) async {
    return _api.updateCart(cartId: cart.id.toString(), cart: cart);
  }
}
