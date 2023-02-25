import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_order_app/data/models/product_list_item_response.dart';
import 'package:online_order_app/data/models/product_model.dart';
import 'package:online_order_app/data/repositories/store_repository_impl.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late StoreRepositoryImpl repository;
  late MockStoreLocalDatasource mockLocalDatasource;
  late MockStoreRemoteDatasource mockRemoteDatasource;

  setUp(() {
    mockRemoteDatasource = MockStoreRemoteDatasource();
    mockLocalDatasource = MockStoreLocalDatasource();
    repository = StoreRepositoryImpl(
      mockRemoteDatasource,
      mockLocalDatasource,
    );
  });

  const productModel = ProductModel(
      id: 1,
      title: 'iPhone 9',
      description: 'An apple mobile which is nothing like apple',
      price: 549,
      discountPercentage: 12.96,
      rating: 4.69,
      stock: 94,
      brand: 'Apple',
      category: 'smartphones',
      thumbnail: 'https://i.dummyjson.com/data/products/1/thumbnail.jpg',
      images: [
        'https://i.dummyjson.com/data/products/1/1.jpg',
      ]);

  final productList = [productModel];

  final productListResponse = ProductListItemResponse(
    limit: 0,
    products: productList,
    skip: 0,
    total: 1,
  );
  group('Products', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      when(mockRemoteDatasource.getAllProducts())
          .thenAnswer((_) async => productListResponse);

      final result = await repository.getAllProducts();

      verify(mockRemoteDatasource.getAllProducts());

      final resultList =
          result.getOrElse(() => const ProductListItemResponse());
      expect(resultList, productListResponse);
    });
  });
}
