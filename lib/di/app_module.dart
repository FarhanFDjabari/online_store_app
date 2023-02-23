import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/datasources/local/store_local_datasource.dart';
import 'package:online_order_app/data/datasources/remote/api/api_service.dart';
import 'package:online_order_app/data/datasources/remote/env/environment.dart';
import 'package:online_order_app/data/datasources/remote/interceptor/dio.dart';
import 'package:online_order_app/data/datasources/remote/store_remote_datasource.dart';
import 'package:online_order_app/data/repositories/store_repository_impl.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

@module
abstract class AppModule {
  @lazySingleton
  StoreRepository getRepository(
    StoreRemoteDatasource remoteDatasource,
    StoreLocalDatasource localDatasource,
  ) =>
      StoreRepositoryImpl(
        remoteDatasource,
        localDatasource,
      );

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
}
