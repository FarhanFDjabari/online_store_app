import 'package:online_order_app/data/datasources/local/store_local_datasource.dart';
import 'package:online_order_app/data/datasources/remote/store_remote_datasource.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  StoreRepository,
  StoreRemoteDatasource,
  StoreLocalDatasource,
])
void main() {}
