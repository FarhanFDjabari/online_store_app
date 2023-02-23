import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/data/models/product_list_item_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET('products')
  Future<List<ProductListItemModel>> fetchAllProducts();

  @GET('products/{id}')
  Future<ProductListItemModel> fetchProductById({
    @Path('id') required String productId,
  });

  @GET('carts')
  Future<List<CartModel>> fetchAllCarts();

  @POST('carts')
  Future<CartModel> postNewCart({
    @Body() required CartModel cart,
  });

  @PUT('carts/{id}')
  Future<CartModel> updateCart({
    @Path('id') required String cartId,
    @Body() required CartModel cart,
  });

  @GET('carts/{id}')
  Future<CartModel> fetchCartById({
    @Path('id') required String cartId,
  });
}
