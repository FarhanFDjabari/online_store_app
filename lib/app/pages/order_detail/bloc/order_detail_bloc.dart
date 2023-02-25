import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

part 'order_detail_event.dart';
part 'order_detail_state.dart';

@injectable
class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  final StoreRepository _repository;

  OrderDetailBloc(
    this._repository,
  ) : super(OrderDetailInitial()) {
    on<LoadOrderDetailEvent>((event, emit) async {
      emit(OrderDetailLoading());
      final savedOrder = await _repository.getSavedCartById(event.orderId);

      savedOrder.fold(
        (l) => emit(OrderDetailError(l)),
        (localData) => emit(
          OrderDetailLoaded(localData),
        ),
      );
    });
    on<DeleteCartEvent>((event, emit) async {
      emit(OrderDetailLoading());
      final result = await _repository.deleteCart(event.cart);

      result.fold(
        (l) => emit(OrderDetailError(l)),
        (remoteData) {
          emit(OrderDeleteSuccess("Berhasil melakukan perubahan", event.cart));
        },
      );
    });
  }
}
