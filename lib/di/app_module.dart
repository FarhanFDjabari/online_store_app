import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/datasources/local/dao/cart_dao.dart';
import 'package:online_order_app/data/datasources/local/db/store_database.dart';
import 'package:online_order_app/data/datasources/local/store_local_datasource.dart';
import 'package:online_order_app/data/datasources/remote/api/api_service.dart';
import 'package:online_order_app/data/datasources/remote/env/environment.dart';
import 'package:online_order_app/data/datasources/remote/interceptor/dio.dart';

@module
abstract class AppModule {
  @lazySingleton
  CartDao getDao(StoreDatabase db) => db.cartDao;

  @lazySingleton
  ApiServices getStoreApi() {
    final defHeader = Map<String, dynamic>.from({});
    defHeader["Accept"] = "application/json";

    return ApiServices(
      AppDio().getDio(
        headers: defHeader,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ),
      baseUrl: Environments.getEnvironment(),
    );
  }

  @preResolve
  Future<StoreDatabase> getDatabase() async =>
      await $FloorStoreDatabase.databaseBuilder('store.db').build();
}
