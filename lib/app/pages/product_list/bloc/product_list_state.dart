part of 'product_list_bloc.dart';

abstract class ProductListState extends Equatable {
  const ProductListState();
  
  @override
  List<Object> get props => [];
}

class ProductListInitial extends ProductListState {}
