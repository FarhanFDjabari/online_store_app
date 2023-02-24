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
      final result = await _repository.getCartById(event.orderId.toString());
      result.fold(
        (l) => emit(TransactionResultError(l)),
        (remoteData) async {
          if (remoteData != null) {
            emit(TransactionResultLoaded(remoteData));
          } else {
            final savedResult =
                await _repository.getSavedCartById(event.orderId);
            savedResult.fold(
              (l) => emit(TransactionResultError(l)),
              (localData) => emit(TransactionResultLoaded(localData)),
            );
          }
        },
      );
    });
    on<DeleteCartEvent>((event, emit) async {
      emit(TransactionResultLoading());
      final result = await _repository.deleteCart(event.cart);
      result.fold(
        (l) => emit(TransactionResultError(l)),
        (r) => emit(TransactionResultSuccess()),
      );
    });
  }
}
