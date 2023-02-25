import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_order_app/app/pages/product_list/widgets/add_to_cart_fab.dart';
import 'package:online_order_app/app/pages/product_list/widgets/product_list.dart';
import 'package:online_order_app/app/routes/route_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_order_app/app/routes/route_path.dart';
import 'package:online_order_app/app/widgets/store_dialog.dart';
import 'package:online_order_app/data/models/product_model.dart';
import 'package:online_order_app/injection.dart';

import 'bloc/product_list_bloc.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  Map<String, int> selectedProducts = {};
  List<ProductModel> tempProducts = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListBloc>(
      create: (context) =>
          getIt.get<ProductListBloc>()..add(LoadProductListEvent()),
      child: Builder(
        builder: (context) {
          return BlocListener<ProductListBloc, ProductListState>(
            listener: (context, state) {
              if (state.status == ProductListStatus.changed) {
                selectedProducts = state.tempSelectedProduct;
              } else if (state.status == ProductListStatus.success) {
                selectedProducts.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.75),
                    padding: const EdgeInsets.all(16),
                  ),
                );
              } else if (state.status == ProductListStatus.uploadError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.75),
                    padding: const EdgeInsets.all(16),
                  ),
                );
              } else if (state.status == ProductListStatus.loaded) {
                tempProducts = state.productList;
              }
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
                            if (state.status == ProductListStatus.loaded) {
                              return ProductList(
                                products: tempProducts,
                                onAddQty: (id) {
                                  context.read<ProductListBloc>().add(
                                      AddProductQuantityEvent(
                                          id, selectedProducts));
                                },
                                onSubsQty: (id) {
                                  context.read<ProductListBloc>().add(
                                      SubtractProductQuantityEvent(
                                          id, selectedProducts));
                                },
                                selectedProducts: selectedProducts,
                              );
                            } else if (state.status ==
                                ProductListStatus.changed) {
                              return ProductList(
                                products: tempProducts,
                                onAddQty: (id) {
                                  context.read<ProductListBloc>().add(
                                      AddProductQuantityEvent(
                                          id, selectedProducts));
                                },
                                onSubsQty: (id) {
                                  context.read<ProductListBloc>().add(
                                      SubtractProductQuantityEvent(
                                          id, selectedProducts));
                                },
                                selectedProducts: selectedProducts,
                              );
                            } else if (state.status ==
                                    ProductListStatus.uploadError ||
                                state.status == ProductListStatus.success) {
                              return ProductList(
                                products: tempProducts,
                                onAddQty: (id) {
                                  context.read<ProductListBloc>().add(
                                      AddProductQuantityEvent(
                                          id, selectedProducts));
                                },
                                onSubsQty: (id) {
                                  context.read<ProductListBloc>().add(
                                      SubtractProductQuantityEvent(
                                          id, selectedProducts));
                                },
                                selectedProducts: selectedProducts,
                              );
                            } else if (state.status ==
                                ProductListStatus.error) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    state.message,
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
                      BlocBuilder<ProductListBloc, ProductListState>(
                          builder: (context, state) {
                        return AddToCartFab(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return StoreDialog(
                                  title: 'Add To Cart Conrfirmation',
                                  description:
                                      'Are you sure to add product to your cart?',
                                  onSuccessPressed: () {
                                    context.pop();
                                    context
                                        .read<ProductListBloc>()
                                        .add(AddCartEvent(selectedProducts));
                                  },
                                  onCancelPressed: () {
                                    context.pop();
                                  },
                                  successButtonLabel: 'Yes',
                                  cancelButtonLabel: 'Cancel',
                                );
                              },
                            );
                          },
                          isLoading:
                              state.status == ProductListStatus.addCartLoading,
                          isEnable: state.status !=
                                  ProductListStatus.addCartLoading &&
                              context
                                  .read<ProductListBloc>()
                                  .isInputValid(selectedProducts),
                        );
                      }),
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
