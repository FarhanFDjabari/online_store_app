import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/models/product_model.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

@injectable
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final StoreRepository _repository;

  ProductDetailBloc(
    this._repository,
  ) : super(ProductDetailInitial()) {
    on<LoadProductDetailEvent>((event, emit) async {
      emit(ProductDetailLoading());
      final result =
          await _repository.getProductById(event.productId.toString());
      result.fold(
        (l) => emit(ProductDetailError(l)),
        (r) => emit(ProductDetailLoaded(r)),
      );
    });
  }
}
