import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:online_order_app/app/pages/order/bloc/order_bloc.dart';
import 'package:online_order_app/app/pages/order/widgets/cart_item.dart';
import 'package:online_order_app/app/routes/route_path.dart';
import 'package:online_order_app/app/widgets/store_dialog.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/injection.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<CartModel> carts = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderBloc>(
      create: (context) => getIt<OrderBloc>()..add(LoadAllOrderEvent()),
      child: BlocListener<OrderBloc, OrderState>(
        listener: (_, state) {
          if (state is OrderDeleteSuccess) {
            carts.remove(state.cart);
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
          } else if (state is OrderLoaded) {
            carts = state.carts;
          }
        },
        child: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onBackground),
              title: Text(
                'My Cart',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    if (state is OrderLoaded || state is OrderDeleteSuccess) {
                      if (carts.isEmpty) {
                        return const Center(
                          child: Text('Cart is Empty'),
                        );
                      }
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 16),
                        itemCount: carts.length,
                        itemBuilder: (context, index) {
                          final cart = carts[index];
                          final cartItemTitle = cart.products
                              ?.map((e) => e.title?.substring(0, 5))
                              .toList()
                              .join(', ');
                          return CartItem(
                            title: "$cartItemTitle,...",
                            productCount: cart.products?.length ?? 0,
                            onTap: () {
                              context.push('${RoutePath.order}/${cart.id}');
                            },
                            onDelete: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return StoreDialog(
                                    title: 'Delete Cart Conrfirmation',
                                    description: 'Are you sure to delete cart?',
                                    onSuccessPressed: () {
                                      context.pop();
                                      context
                                          .read<OrderBloc>()
                                          .add(DeleteCartEvent(cart));
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
                          );
                        },
                      );
                    } else if (state is OrderError) {
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
            ),
          );
        }),
      ),
    );
  }
}
