import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_order_app/app/pages/product_list/widgets/add_to_cart_fab.dart';
import 'package:online_order_app/app/pages/product_list/widgets/product_list.dart';
import 'package:online_order_app/app/routes/route_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_order_app/injection.dart';

import 'bloc/product_list_bloc.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListBloc>(
      create: (context) =>
          getIt.get<ProductListBloc>()..add(LoadProductListEvent()),
      child: Builder(
        builder: (context) {
          return BlocListener<ProductListBloc, ProductListState>(
            listener: (context, state) {
              if (state is ProductListError) {}
            },
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.background,
                elevation: 0,
                leading: Icon(
                  Icons.shopping_basket_outlined,
                  color: Theme.of(context).colorScheme.onBackground,
                  size: 50.sp,
                ),
                actions: [
                  InkWell(
                    onTap: () => context.pushNamed(RouteName.order),
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 50.sp,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10.sp),
                      Text(
                        'Online Store',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        'Products',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(height: 5.sp),
                      Expanded(
                        child: BlocBuilder<ProductListBloc, ProductListState>(
                          builder: (context, state) {
                            if (state is ProductListLoaded) {
                              return ProductList(
                                products: state.productList,
                                onAddQty: (id) {
                                  getIt<ProductListBloc>()
                                      .add(AddProductQuantityEvent(id));
                                },
                                onSubsQty: (id) {
                                  getIt<ProductListBloc>()
                                      .add(SubtractProductQuantityEvent(id));
                                },
                                selectedProducts: state.tempSelectedProduct,
                              );
                            } else if (state is ProductListChanged) {
                              debugPrint(state.tempSelectedProduct.toString());
                              return ProductList(
                                products: state.productList,
                                onAddQty: (id) {
                                  getIt<ProductListBloc>()
                                      .add(AddProductQuantityEvent(id));
                                },
                                onSubsQty: (id) {
                                  getIt<ProductListBloc>()
                                      .add(SubtractProductQuantityEvent(id));
                                },
                                selectedProducts: state.tempSelectedProduct,
                              );
                            } else if (state is ProductListError) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    "${state.message}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                          fontSize: 24.sp,
                                        ),
                                  ),
                                ),
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 15.sp),
                      AddToCartFab(
                        onPressed: () {},
                        isEnable: getIt<ProductListBloc>().isInputValid(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
