import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

part 'transaction_result_event.dart';
part 'transaction_result_state.dart';

@injectable
class TransactionResultBloc
    extends Bloc<TransactionResultEvent, TransactionResultState> {
  final StoreRepository _repository;

  TransactionResultBloc(this._repository) : super(TransactionResultInitial()) {
    on<LoadTransactionResultEvent>((event, emit) async {
      emit(TransactionResultLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(TransactionResultLoaded(event.cart));
    });
  }
}
