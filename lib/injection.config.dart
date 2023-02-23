// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:online_order_app/app/pages/order/bloc/order_bloc.dart' as _i4;
import 'package:online_order_app/app/pages/product_detail/bloc/product_detail_bloc.dart'
    as _i5;
import 'package:online_order_app/app/pages/product_list/bloc/product_list_bloc.dart'
    as _i6;
import 'package:online_order_app/app/pages/splash/bloc/splash_bloc.dart' as _i7;
import 'package:online_order_app/app/pages/transaction_result/bloc/transaction_result_bloc.dart'
    as _i11;
import 'package:online_order_app/data/datasources/local/store_local_datasource.dart'
    as _i8;
import 'package:online_order_app/data/datasources/remote/api/api_service.dart'
    as _i3;
import 'package:online_order_app/data/datasources/remote/store_remote_datasource.dart'
    as _i9;
import 'package:online_order_app/di/app_module.dart' as _i12;
import 'package:online_order_app/domain/repositories/store_repository.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i4.OrderBloc>(() => _i4.OrderBloc());
    gh.factory<_i5.ProductDetailBloc>(() => _i5.ProductDetailBloc());
    gh.factory<_i6.ProductListBloc>(() => _i6.ProductListBloc());
    gh.factory<_i7.SplashBloc>(() => _i7.SplashBloc());
    gh.lazySingleton<_i8.StoreLocalDatasource>(
        () => _i8.StoreLocalDatasource());
    gh.lazySingleton<_i9.StoreRemoteDatasource>(
        () => _i9.StoreRemoteDatasource());
    gh.lazySingleton<_i10.StoreRepository>(() => appModule.getRepository(
          gh<_i9.StoreRemoteDatasource>(),
          gh<_i8.StoreLocalDatasource>(),
        ));
    gh.factory<_i11.TransactionResultBloc>(() => _i11.TransactionResultBloc());
    return this;
  }
}

class _$AppModule extends _i12.AppModule {}
