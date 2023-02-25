part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class AddProductQuantityEvent extends ProductListEvent {
  final String productId;
  final Map<String, int> selectedProduct;

  const AddProductQuantityEvent(this.productId, this.selectedProduct);

  @override
  List<Object> get props => [productId, selectedProduct];
}

class SubtractProductQuantityEvent extends ProductListEvent {
  final String productId;
  final Map<String, int> selectedProduct;

  const SubtractProductQuantityEvent(this.productId, this.selectedProduct);

  @override
  List<Object> get props => [productId, selectedProduct];
}

class AddCartEvent extends ProductListEvent {
  final Map<String, int> selectedProduct;

  const AddCartEvent(this.selectedProduct);

  @override
  List<Object> get props => [selectedProduct];
}

class LoadProductListEvent extends ProductListEvent {}
