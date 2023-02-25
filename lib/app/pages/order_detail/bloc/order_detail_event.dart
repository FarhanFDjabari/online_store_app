part of 'order_detail_bloc.dart';

abstract class OrderDetailEvent extends Equatable {
  const OrderDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadOrderDetailEvent extends OrderDetailEvent {
  final int orderId;
  const LoadOrderDetailEvent(this.orderId);
}

class UpdateCartEvent extends OrderDetailEvent {
  final CartModel cart;
  const UpdateCartEvent(this.cart);
}

class DeleteCartEvent extends OrderDetailEvent {
  final CartModel cart;
  const DeleteCartEvent(this.cart);

  @override
  List<Object> get props => [cart];
}

class OrderCartEvent extends OrderDetailEvent {
  final CartModel cart;
  const OrderCartEvent(this.cart);
}
