part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadProductDetailEvent extends ProductDetailEvent {
  final int productId;
  const LoadProductDetailEvent(this.productId);
}
