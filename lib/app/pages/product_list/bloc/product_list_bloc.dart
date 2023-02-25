import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/data/models/cart_product.dart';
import 'package:online_order_app/data/models/cart_product_type_converter.dart';
import 'package:online_order_app/data/models/product_model.dart';
import 'package:online_order_app/domain/repositories/store_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

@injectable
class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final StoreRepository _repository;

  ProductListBloc(this._repository) : super(ProductListState.initial()) {
    on<LoadProductListEvent>((event, emit) async {
      emit(ProductListState.loading());
      final result = await _repository.getAllProducts();
      result.fold(
        (l) => emit(ProductListState.error(l)),
        (r) {
          emit(ProductListState.loaded(r.products ?? []));
        },
      );
    });
    on<AddProductQuantityEvent>((event, emit) async {
      Map<String, int> changedListMap = {};
      changedListMap.addEntries(event.selectedProduct.entries);
      var prevQty = event.selectedProduct[event.productId] ?? 0;

      changedListMap.update(event.productId, (value) => ++prevQty,
          ifAbsent: () => 1);

      emit(ProductListState.changed(false, changedListMap, state.productList));
    });
    on<SubtractProductQuantityEvent>((event, emit) async {
      if (isProductSelected(event.productId, event.selectedProduct)) {
        if (event.selectedProduct[event.productId]! > 0) {
          Map<String, int> changedListMap = {};
          changedListMap.addEntries(event.selectedProduct.entries);

          var prevQty = event.selectedProduct[event.productId] ?? 0;

          changedListMap.update(event.productId, (value) => --prevQty);

          emit(ProductListState.changed(
              true, changedListMap, state.productList));
        }
      }
    });
    on<AddCartEvent>((event, emit) async {
      emit(ProductListState.addCartLoading());

      final cartProducts = _generateProductCartList(event.selectedProduct);

      var cart = CartModel(
        id: 0,
        products: cartProducts,
        userId: 100,
      );

      final addCartResult = await _repository.addCart(cart);

      addCartResult.fold(
        (l) => emit(ProductListState.uploadError(l, state.productList)),
        (r) {
          cart = r;
        },
      );
      final saveCartResult = await _repository.saveCart(cart);
      saveCartResult.fold(
        (l) => emit(ProductListState.uploadError(l, state.productList)),
        (r) => emit(ProductListState.success("Successfully add cart")),
      );
    });
  }

  List<CartProduct> _generateProductCartList(Map<String, int> selectedProduct) {
    if (selectedProduct.isNotEmpty) {
      final result = selectedProduct.entries
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

  bool isProductSelected(String productId, Map<String, int> selectedProduct) {
    return selectedProduct.containsKey(productId);
  }

  bool isInputValid(Map<String, int> selectedProduct) {
    return selectedProduct.values.any((element) => element > 0);
  }
}
