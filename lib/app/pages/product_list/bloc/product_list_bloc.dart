import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_order_app/domain/usecases/add_cart.dart';
import 'package:online_order_app/domain/usecases/get_all_products.dart';
import 'package:online_order_app/domain/usecases/save_cart.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

@injectable
class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetAllProducts _getAllProducts;
  final AddCart addCart;
  final SaveCart saveCart;

  ProductListBloc(
    this._getAllProducts,
    this.addCart,
    this.saveCart,
  ) : super(ProductListInitial()) {
    on<ProductListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
