import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/models/cart_list_response.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/data/models/product_list_item_response.dart';
import 'package:online_order_app/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET('products')
  Future<ProductListItemResponse> fetchAllProducts();

  @GET('products/{id}')
  Future<ProductModel> fetchProductById({
    @Path('id') required String productId,
  });

  @GET('carts')
  Future<CartListResponse> fetchAllCarts();

  @POST('carts/add')
  Future<CartModel> postNewCart({
    @Body() required Map<String, dynamic> cart,
  });

  @PUT('carts/{id}')
  Future<CartModel> updateCart({
    @Path('id') required String cartId,
    @Body() required CartModel cart,
  });

  @GET('carts/{id}')
  Future<CartModel?> fetchCartById({
    @Path('id') required String cartId,
  });
}
