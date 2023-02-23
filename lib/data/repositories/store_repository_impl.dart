import 'package:online_order_app/data/datasources/local/store_local_datasource.dart';
import 'package:online_order_app/data/datasources/remote/store_remote_datasource.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

class StoreRepositoryImpl extends StoreRepository {
  final StoreRemoteDatasource _remoteDatasource;
  final StoreLocalDatasource _localDatasource;

  StoreRepositoryImpl(this._remoteDatasource, this._localDatasource);
}
