part of 'order_detail_bloc.dart';

abstract class OrderDetailState extends Equatable {
  const OrderDetailState();
  
  @override
  List<Object> get props => [];
}

class OrderDetailInitial extends OrderDetailState {}
