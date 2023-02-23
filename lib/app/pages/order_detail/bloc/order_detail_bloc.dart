import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/domain/usecases/get_cart_by_id.dart';
import 'package:online_order_app/domain/usecases/get_product_by_id.dart';
import 'package:online_order_app/domain/usecases/get_saved_cart_by_id.dart';

part 'order_detail_event.dart';
part 'order_detail_state.dart';

@injectable
class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  final GetCartById _getCartById;
  final GetSavedCartById _getSavedCartById;
  final GetProductById _getProductById;

  OrderDetailBloc(
    this._getCartById,
    this._getSavedCartById,
    this._getProductById,
  ) : super(OrderDetailInitial()) {
    on<OrderDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
