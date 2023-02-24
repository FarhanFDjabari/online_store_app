part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class LoadAllOrderEvent extends OrderEvent {}

class DeleteCartEvent extends OrderEvent {
  final CartModel cart;
  const DeleteCartEvent(this.cart);
}
