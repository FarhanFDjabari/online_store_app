// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:online_order_app/app/pages/order/bloc/order_bloc.dart' as _i12;
import 'package:online_order_app/app/pages/order_detail/bloc/order_detail_bloc.dart'
    as _i13;
import 'package:online_order_app/app/pages/product_detail/bloc/product_detail_bloc.dart'
    as _i14;
import 'package:online_order_app/app/pages/product_list/bloc/product_list_bloc.dart'
    as _i15;
import 'package:online_order_app/app/pages/splash/bloc/splash_bloc.dart' as _i4;
import 'package:online_order_app/app/pages/transaction_result/bloc/transaction_result_bloc.dart'
    as _i11;
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
import 'package:online_order_app/data/repositories/store_repository_impl.dart'
    as _i10;
import 'package:online_order_app/di/app_module.dart' as _i16;
import 'package:online_order_app/domain/repositories/store_repository.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.ApiServices>(() => appModule.getStoreApi());
    gh.factory<_i4.SplashBloc>(() => _i4.SplashBloc());
    await gh.factoryAsync<_i5.StoreDatabase>(
      () => appModule.getDatabase(),
      preResolve: true,
    );
    gh.lazySingleton<_i6.StoreRemoteDatasource>(
        () => _i6.StoreRemoteDatasource(gh<_i3.ApiServices>()));
    gh.lazySingleton<_i7.CartDao>(
        () => appModule.getDao(gh<_i5.StoreDatabase>()));
    gh.lazySingleton<_i8.StoreLocalDatasource>(
        () => _i8.StoreLocalDatasource(gh<_i7.CartDao>()));
    gh.lazySingleton<_i9.StoreRepository>(() => _i10.StoreRepositoryImpl(
          gh<_i6.StoreRemoteDatasource>(),
          gh<_i8.StoreLocalDatasource>(),
        ));
    gh.factory<_i11.TransactionResultBloc>(
        () => _i11.TransactionResultBloc(gh<_i9.StoreRepository>()));
    gh.factory<_i12.OrderBloc>(() => _i12.OrderBloc(gh<_i9.StoreRepository>()));
    gh.factory<_i13.OrderDetailBloc>(
        () => _i13.OrderDetailBloc(gh<_i9.StoreRepository>()));
    gh.factory<_i14.ProductDetailBloc>(
        () => _i14.ProductDetailBloc(gh<_i9.StoreRepository>()));
    gh.factory<_i15.ProductListBloc>(
        () => _i15.ProductListBloc(gh<_i9.StoreRepository>()));
    return this;
  }
}

class _$AppModule extends _i16.AppModule {}
