import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/datasources/local/dao/cart_dao.dart';
import 'package:online_order_app/data/models/cart_table.dart';

@lazySingleton
class StoreLocalDatasource {
  final CartDao _dao;

  StoreLocalDatasource(this._dao);

  Future<List<CartTable>> getAllSavedCart() async {
    return _dao.getAllCart();
  }

  Future<CartTable?> getSavedCartById(int cartId) async {
    return _dao.getCartById(cartId);
  }

  Future<void> updateSavedCart(CartTable cart) async {
    return _dao.updateCart(cart);
  }

  Future<void> saveCart(CartTable cart) async {
    return _dao.saveCart(cart);
  }

  Future<void> deleteCart(CartTable cart) async {
    return _dao.deleteCart(cart);
  }
}
