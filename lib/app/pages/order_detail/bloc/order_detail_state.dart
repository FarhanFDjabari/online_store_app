part of 'order_detail_bloc.dart';

abstract class OrderDetailState extends Equatable {
  const OrderDetailState();

  @override
  List<Object> get props => [];
}

class OrderDetailInitial extends OrderDetailState {}

class OrderDetailLoading extends OrderDetailState {}

class OrderDetailLoaded extends OrderDetailState {
  final CartModel cart;
  const OrderDetailLoaded(this.cart);
}

class OrderDetailError extends OrderDetailState {
  final String message;
  const OrderDetailError(this.message);
}

class OrderDetailSuccess extends OrderDetailState {
  final String message;
  const OrderDetailSuccess(this.message);
}

class OrderDeleteSuccess extends OrderDetailState {
  final String message;
  final CartModel cart;

  const OrderDeleteSuccess(this.message, this.cart);

  @override
  List<Object> get props => [message, cart];
}
