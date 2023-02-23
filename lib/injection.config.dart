// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:online_order_app/app/pages/order/bloc/order_bloc.dart' as _i20;
import 'package:online_order_app/app/pages/order_detail/bloc/order_detail_bloc.dart'
    as _i21;
import 'package:online_order_app/app/pages/product_detail/bloc/product_detail_bloc.dart'
    as _i22;
import 'package:online_order_app/app/pages/product_list/bloc/product_list_bloc.dart'
    as _i25;
import 'package:online_order_app/app/pages/splash/bloc/splash_bloc.dart' as _i4;
import 'package:online_order_app/app/pages/transaction_result/bloc/transaction_result_bloc.dart'
    as _i24;
import 'package:online_order_app/data/datasources/local/dao/cart_dao.dart'
    as _i7;
import 'package:online_order_app/data/datasources/local/db/store_database.dart'
    as _i5;
import 'package:online_order_app/data/datasources/local/store_local_datasource.dart'
    as _i8;
import 'package:online_order_app/data/datasources/remote/api/api_service.dart'
    as _i3;
import 'package:online_order_app/data/datasources/remote/store_remote_datasource.dart'
    as _i6;
import 'package:online_order_app/di/app_module.dart' as _i26;
import 'package:online_order_app/domain/repositories/store_repository.dart'
    as _i9;
import 'package:online_order_app/domain/usecases/add_cart.dart' as _i12;
import 'package:online_order_app/domain/usecases/delete_cart.dart' as _i13;
import 'package:online_order_app/domain/usecases/get_all_carts.dart' as _i14;
import 'package:online_order_app/domain/usecases/get_all_products.dart' as _i15;
import 'package:online_order_app/domain/usecases/get_all_saved_carts.dart'
    as _i16;
import 'package:online_order_app/domain/usecases/get_cart_by_id.dart' as _i17;
import 'package:online_order_app/domain/usecases/get_product_by_id.dart'
    as _i18;
import 'package:online_order_app/domain/usecases/get_saved_cart_by_id.dart'
    as _i19;
import 'package:online_order_app/domain/usecases/save_cart.dart' as _i23;
import 'package:online_order_app/domain/usecases/update_cart.dart' as _i10;
import 'package:online_order_app/domain/usecases/update_saved_cart.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.ApiServices>(() => appModule.getStoreApi());
    gh.factory<_i4.SplashBloc>(() => _i4.SplashBloc());
    gh.lazySingletonAsync<_i5.StoreDatabase>(() => appModule.getDatabase());
    gh.lazySingleton<_i6.StoreRemoteDatasource>(
        () => _i6.StoreRemoteDatasource(gh<_i3.ApiServices>()));
    gh.lazySingletonAsync<_i7.CartDao>(
        () async => appModule.getDao(await getAsync<_i5.StoreDatabase>()));
    gh.lazySingletonAsync<_i8.StoreLocalDatasource>(
        () async => _i8.StoreLocalDatasource(await getAsync<_i7.CartDao>()));
    gh.lazySingletonAsync<_i9.StoreRepository>(
        () async => appModule.getRepository(
              gh<_i6.StoreRemoteDatasource>(),
              await getAsync<_i8.StoreLocalDatasource>(),
            ));
    gh.lazySingletonAsync<_i10.UpdateCart>(
        () async => _i10.UpdateCart(await getAsync<_i9.StoreRepository>()));
    gh.lazySingletonAsync<_i11.UpdateSavedCart>(() async =>
        _i11.UpdateSavedCart(await getAsync<_i9.StoreRepository>()));
    gh.lazySingletonAsync<_i12.AddCart>(
        () async => _i12.AddCart(await getAsync<_i9.StoreRepository>()));
    gh.lazySingletonAsync<_i13.DeleteCart>(
        () async => _i13.DeleteCart(await getAsync<_i9.StoreRepository>()));
    gh.lazySingletonAsync<_i14.GetAllCarts>(
        () async => _i14.GetAllCarts(await getAsync<_i9.StoreRepository>()));
    gh.lazySingletonAsync<_i15.GetAllProducts>(
        () async => _i15.GetAllProducts(await getAsync<_i9.StoreRepository>()));
    gh.lazySingletonAsync<_i16.GetAllSavedCarts>(() async =>
        _i16.GetAllSavedCarts(await getAsync<_i9.StoreRepository>()));
    gh.lazySingletonAsync<_i17.GetCartById>(
        () async => _i17.GetCartById(await getAsync<_i9.StoreRepository>()));
    gh.lazySingletonAsync<_i18.GetProductById>(
        () async => _i18.GetProductById(await getAsync<_i9.StoreRepository>()));
    gh.lazySingletonAsync<_i19.GetSavedCartById>(() async =>
        _i19.GetSavedCartById(await getAsync<_i9.StoreRepository>()));
    gh.factoryAsync<_i20.OrderBloc>(() async => _i20.OrderBloc(
          await getAsync<_i14.GetAllCarts>(),
          await getAsync<_i16.GetAllSavedCarts>(),
          await getAsync<_i10.UpdateCart>(),
          await getAsync<_i11.UpdateSavedCart>(),
          await getAsync<_i13.DeleteCart>(),
        ));
    gh.factoryAsync<_i21.OrderDetailBloc>(() async => _i21.OrderDetailBloc(
          await getAsync<_i17.GetCartById>(),
          await getAsync<_i19.GetSavedCartById>(),
          await getAsync<_i18.GetProductById>(),
        ));
    gh.factoryAsync<_i22.ProductDetailBloc>(() async =>
        _i22.ProductDetailBloc(await getAsync<_i18.GetProductById>()));
    gh.lazySingletonAsync<_i23.SaveCart>(
        () async => _i23.SaveCart(await getAsync<_i9.StoreRepository>()));
    gh.factoryAsync<_i24.TransactionResultBloc>(
        () async => _i24.TransactionResultBloc(
              await getAsync<_i17.GetCartById>(),
              await getAsync<_i19.GetSavedCartById>(),
              await getAsync<_i13.DeleteCart>(),
            ));
    gh.factoryAsync<_i25.ProductListBloc>(() async => _i25.ProductListBloc(
          await getAsync<_i15.GetAllProducts>(),
          await getAsync<_i12.AddCart>(),
          await getAsync<_i23.SaveCart>(),
        ));
    return this;
  }
}

class _$AppModule extends _i26.AppModule {}
