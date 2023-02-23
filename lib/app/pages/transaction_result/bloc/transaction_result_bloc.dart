import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/domain/usecases/delete_cart.dart';
import 'package:online_order_app/domain/usecases/get_cart_by_id.dart';
import 'package:online_order_app/domain/usecases/get_saved_cart_by_id.dart';

part 'transaction_result_event.dart';
part 'transaction_result_state.dart';

@injectable
class TransactionResultBloc
    extends Bloc<TransactionResultEvent, TransactionResultState> {
  final GetCartById _getCartById;
  final GetSavedCartById _getSavedCartById;
  final DeleteCart _deleteCart;

  TransactionResultBloc(
    this._getCartById,
    this._getSavedCartById,
    this._deleteCart,
  ) : super(TransactionResultInitial()) {
    on<TransactionResultEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
