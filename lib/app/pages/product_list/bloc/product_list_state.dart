part of 'product_list_bloc.dart';

abstract class ProductListState extends Equatable {
  final Map<String, int> tempSelectedProduct;
  final List<ProductModel> productList;
  final String? message;

  const ProductListState(
      this.tempSelectedProduct, this.productList, this.message);

  @override
  List<Object> get props => [tempSelectedProduct, productList, message ?? ""];
}

class ProductListInitial extends ProductListState {
  const ProductListInitial() : super(const {}, const [], null);

  @override
  List<Object> get props => [];
}

class ProductListLoading extends ProductListState {
  const ProductListLoading() : super(const {}, const [], null);

  @override
  List<Object> get props => [];
}

class ProductListAddCartLoading extends ProductListState {
  const ProductListAddCartLoading() : super(const {}, const [], null);

  @override
  List<Object> get props => [];
}

class ProductListError extends ProductListState {
  final String errorMessage;

  const ProductListError(this.errorMessage)
      : super(const {}, const [], errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ProductListAddCartError extends ProductListState {
  final String errorMessage;

  const ProductListAddCartError(this.errorMessage)
      : super(const {}, const [], errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ProductListLoaded extends ProductListState {
  final List<ProductModel> products;

  const ProductListLoaded(this.products) : super(const {}, products, null);

  @override
  List<Object> get props => [products];
}

class ProductListSuccess extends ProductListState {
  final String successMessage;

  const ProductListSuccess(this.successMessage)
      : super(const {}, const [], successMessage);

  @override
  List<Object> get props => [successMessage];
}

class ProductListChanged extends ProductListState {
  final Map<String, int> selectedProduct;
  const ProductListChanged(this.selectedProduct)
      : super(selectedProduct, const [], null);

  @override
  List<Object> get props => [selectedProduct];
}
