part of 'transaction_result_bloc.dart';

abstract class TransactionResultEvent extends Equatable {
  const TransactionResultEvent();

  @override
  List<Object> get props => [];
}

class LoadTransactionResultEvent extends TransactionResultEvent {
  final int orderId;
  const LoadTransactionResultEvent(this.orderId);
}

class DeleteCartEvent extends TransactionResultEvent {
  final CartModel cart;
  const DeleteCartEvent(this.cart);
}
