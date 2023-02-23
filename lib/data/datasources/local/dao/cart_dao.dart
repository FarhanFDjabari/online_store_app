import 'package:floor/floor.dart';
import 'package:online_order_app/data/models/cart_table.dart';

@dao
abstract class CartDao {
  @Query('SELECT * FROM cart')
  Future<List<CartTable>> getAllCart();

  @Query('SELECT * FROM cart WHERE id = :cartId')
  Future<CartTable?> getCartById(int cartId);

  @Update(onConflict: OnConflictStrategy.fail)
  Future<void> updateCart(CartTable cart);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveCart(CartTable cart);

  @delete
  Future<void> deleteCart(CartTable cart);
}
