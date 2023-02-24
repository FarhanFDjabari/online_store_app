import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/data/models/cart_product.dart';
import 'package:online_order_app/data/models/product_model.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

@injectable
class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final StoreRepository _repository;

  ProductListBloc(this._repository) : super(ProductListInitial()) {
    on<LoadProductListEvent>((event, emit) async {
      emit(ProductListLoading());
      final result = await _repository.getAllProducts();
      result.fold(
        (l) => emit(ProductListError(l)),
        (r) {
          emit(ProductListLoaded(r.products ?? []));
        },
      );
    });
    on<AddProductQuantityEvent>((event, emit) async {
      Map<String, int> changedListMap = {};
      if (isProductSelected(event.productId)) {
        changedListMap.addAll(state.tempSelectedProduct);
        changedListMap[event.productId] =
            (state.tempSelectedProduct[event.productId] ?? 0) + 1;
      } else {
        changedListMap = {event.productId: 1};
        debugPrint(state.tempSelectedProduct.toString());
      }
      emit(ProductListChanged(changedListMap));
    });
    on<SubtractProductQuantityEvent>((event, emit) async {
      if (isProductSelected(event.productId)) {
        if (state.tempSelectedProduct[event.productId]! > 0) {
          Map<String, int> changedListMap = {};
          changedListMap.addAll(state.tempSelectedProduct);

          changedListMap[event.productId] =
              (state.tempSelectedProduct[event.productId] ?? 0) - 1;
          debugPrint(state.tempSelectedProduct.toString());
          emit(ProductListChanged(changedListMap));
        }
      }
    });
    on<AddCartEvent>((event, emit) async {
      emit(ProductListAddCartLoading());

      // final addCartResult = await _repository.addCart(cart);
      // addCartResult.fold(
      //   (l) => emit(ProductListError(l)),
      //   (r) async {
      //     final saveCartResult = await _repository.saveCart(r);
      //     saveCartResult.fold(
      //       (l) => emit(ProductListError(l)),
      //       (r) => emit(
      //         const ProductListSuccess("Berhasil menambahkan ke keranjang"),
      //       ),
      //     );
      //   },
      // );
    });
  }

  List<CartProduct> _generateProductCartList() {
    if (state.tempSelectedProduct.isNotEmpty) {
      final result = state.tempSelectedProduct.entries
          .map(
            (e) => CartProduct(
              id: int.parse(e.key),
              quantity: e.value,
            ),
          )
          .toList();

      return result;
    }
    return [];
  }

  bool isProductSelected(String productId) {
    return state.tempSelectedProduct.containsKey(productId);
  }

  bool isInputValid() {
    return state.tempSelectedProduct.values.any((element) => element > 0);
  }
}
