import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/datasources/local/dao/cart_dao.dart';
import 'package:online_order_app/data/datasources/remote/store_remote_datasource.dart';
import 'package:online_order_app/data/models/cart_table.dart';

abstract class StoreLocalDatasource {
  Future<void> deleteCart(CartTable cart);
  Future<void> saveCart(CartTable cart);
  Future<void> updateSavedCart(CartTable cart);
  Future<CartTable?> getSavedCartById(int cartId);
  Future<List<CartTable>> getAllSavedCart();
}

@LazySingleton(as: StoreLocalDatasource)
class StoreLocalDatasourceImpl extends StoreLocalDatasource {
  final CartDao _dao;

  StoreLocalDatasourceImpl(this._dao);

  @override
  Future<List<CartTable>> getAllSavedCart() async {
    return _dao.getAllCart();
  }

  @override
  Future<CartTable?> getSavedCartById(int cartId) async {
    return _dao.getCartById(cartId);
  }

  @override
  Future<void> updateSavedCart(CartTable cart) async {
    return _dao.updateCart(cart);
  }

  @override
  Future<void> saveCart(CartTable cart) async {
    return _dao.saveCart(cart);
  }

  @override
  Future<void> deleteCart(CartTable cart) async {
    return _dao.deleteCart(cart);
  }
}
