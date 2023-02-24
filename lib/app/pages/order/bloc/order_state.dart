part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {
  final String message;
  const OrderSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class OrderLoaded extends OrderState {
  final List<CartModel> carts;
  const OrderLoaded(this.carts);
}

class OrderError extends OrderState {
  final String message;
  const OrderError(this.message);
}
