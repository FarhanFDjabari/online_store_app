import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/domain/usecases/delete_cart.dart';
import 'package:online_order_app/domain/usecases/get_all_carts.dart';
import 'package:online_order_app/domain/usecases/get_all_saved_carts.dart';
import 'package:online_order_app/domain/usecases/update_cart.dart';
import 'package:online_order_app/domain/usecases/update_saved_cart.dart';

part 'order_event.dart';
part 'order_state.dart';

@injectable
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetAllCarts _getAllCarts;
  final GetAllSavedCarts _getAllSavedCarts;
  final UpdateSavedCart _updateSavedCart;
  final UpdateCart _updateCart;
  final DeleteCart _deleteCart;

  OrderBloc(
    this._getAllCarts,
    this._getAllSavedCarts,
    this._updateCart,
    this._updateSavedCart,
    this._deleteCart,
  ) : super(OrderInitial()) {
    on<OrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
