part of 'transaction_result_bloc.dart';

abstract class TransactionResultEvent extends Equatable {
  const TransactionResultEvent();

  @override
  List<Object> get props => [];
}

class LoadTransactionResultEvent extends TransactionResultEvent {
  final int orderId;
  final CartModel cart;
  const LoadTransactionResultEvent(this.orderId, this.cart);
}

class DeleteCartEvent extends TransactionResultEvent {
  final CartModel cart;
  const DeleteCartEvent(this.cart);
}
