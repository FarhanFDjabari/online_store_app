part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class AddProductQuantityEvent extends ProductListEvent {
  final String productId;

  const AddProductQuantityEvent(this.productId);
}

class SubtractProductQuantityEvent extends ProductListEvent {
  final String productId;

  const SubtractProductQuantityEvent(this.productId);
}

class AddCartEvent extends ProductListEvent {}

class LoadProductListEvent extends ProductListEvent {}
