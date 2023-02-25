part of 'product_list_bloc.dart';

enum ProductListStatus {
  initial,
  loading,
  addCartLoading,
  success,
  loaded,
  error,
  uploadError,
  changed,
}

class ProductListState extends Equatable {
  ProductListState._({
    this.status = ProductListStatus.initial,
    this.productList = const [],
    this.tempSelectedProduct = const {},
    this.isSubtraction = false,
    this.message = '',
  });

  ProductListState.initial() : this._();

  ProductListState.loading() : this._(status: ProductListStatus.loading);

  ProductListState.addCartLoading()
      : this._(status: ProductListStatus.addCartLoading);

  ProductListState.success(String message)
      : this._(
          status: ProductListStatus.success,
          message: message,
        );

  ProductListState.loaded(List<ProductModel> products)
      : this._(
          status: ProductListStatus.loaded,
          productList: products,
        );

  ProductListState.changed(bool isSubtraction,
      Map<String, int> selectedProducts, List<ProductModel> productList)
      : this._(
          status: ProductListStatus.changed,
          tempSelectedProduct: selectedProducts,
          isSubtraction: isSubtraction,
          productList: productList,
        );

  ProductListState.error(String message)
      : this._(
          status: ProductListStatus.error,
          message: message,
        );

  ProductListState.uploadError(String message, List<ProductModel> productList)
      : this._(
          status: ProductListStatus.uploadError,
          message: message,
          productList: productList,
        );

  final ProductListStatus status;
  Map<String, int> tempSelectedProduct;
  final bool isSubtraction;
  final List<ProductModel> productList;
  final String message;

  @override
  List<Object> get props => [status, tempSelectedProduct, productList, message];
}
