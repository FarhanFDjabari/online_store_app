part of 'transaction_result_bloc.dart';

abstract class TransactionResultState extends Equatable {
  const TransactionResultState();
  
  @override
  List<Object> get props => [];
}

class TransactionResultInitial extends TransactionResultState {}
