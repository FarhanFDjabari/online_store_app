part of 'transaction_result_bloc.dart';

abstract class TransactionResultState extends Equatable {
  const TransactionResultState();

  @override
  List<Object> get props => [];
}

class TransactionResultInitial extends TransactionResultState {}

class TransactionResultLoading extends TransactionResultState {}

class TransactionResultLoaded extends TransactionResultState {
  final CartModel cart;
  const TransactionResultLoaded(this.cart);
}

class TransactionResultSuccess extends TransactionResultState {}

class TransactionResultError extends TransactionResultState {
  final String message;
  const TransactionResultError(this.message);
}
