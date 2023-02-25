import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
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
      final localResult = await _repository.getAllSavedCart();
      localResult.fold(
        (l) {
          debugPrint(l);
          emit(OrderError(l));
        },
        (localList) {
          emit(OrderLoaded([...localList]));
        },
      );
    });
    on<DeleteCartEvent>((event, emit) async {
      emit(OrderLoading());
      final result = await _repository.deleteCart(event.cart);
      result.fold(
        (l) => emit(OrderError(l)),
        (r) => emit(
          OrderDeleteSuccess("Berhasil menghapus keranjang", event.cart),
        ),
      );
    });
  }
}
