import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

@injectable
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final StoreRepository _repository;

  OrderBloc(this._repository) : super(OrderInitial()) {
    on<LoadAllOrderEvent>((event, emit) async {
      emit(OrderLoading());
      final result = await _repository.getAllCarts();
      final localResult = await _repository.getAllSavedCart();
      result.fold(
        (l) => emit(OrderError(l)),
        (remoteList) {
          localResult.fold(
            (l) => emit(OrderError(l)),
            (localList) {
              emit(OrderLoaded([...?remoteList.carts, ...localList]));
            },
          );
        },
      );
    });
    on<DeleteCartEvent>((event, emit) async {
      emit(OrderLoading());
      final result = await _repository.deleteCart(event.cart);
      result.fold(
        (l) => emit(OrderError(l)),
        (r) => emit(
          const OrderSuccess("Berhasil menghapus keranjang"),
        ),
      );
    });
  }
}
