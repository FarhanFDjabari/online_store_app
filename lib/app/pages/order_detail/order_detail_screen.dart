import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:online_order_app/app/pages/order_detail/bloc/order_detail_bloc.dart';
import 'package:online_order_app/app/pages/order_detail/widgets/order_card.dart';
import 'package:online_order_app/app/routes/route_path.dart';
import 'package:online_order_app/app/widgets/store_dialog.dart';
import 'package:online_order_app/injection.dart';

class OrderDetailScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailScreen({required this.orderId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderDetailBloc>(
      create: (context) => getIt<OrderDetailBloc>()
        ..add(LoadOrderDetailEvent(int.parse(orderId))),
      child: BlocListener<OrderDetailBloc, OrderDetailState>(
        listener: (_, state) {
          if (state is OrderDeleteSuccess) {
            context.go(
              '${RoutePath.order}/${state.cart.id}/transaction',
              extra: state.cart,
            );
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
                'Cart Detail',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: BlocBuilder<OrderDetailBloc, OrderDetailState>(
                    builder: (context, state) {
                      if (state is OrderDetailLoaded) {
                        return OrderCard(
                          products: state.cart.products ?? [],
                        );
                      } else if (state is OrderDetailError) {
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: BlocBuilder<OrderDetailBloc, OrderDetailState>(
                    builder: (context, state) {
                      if (state is OrderDetailLoaded) {
                        return Column(
                          children: [
                            const Text('Total:'),
                            Text('\$${state.cart.total}'),
                            SizedBox(height: 5.sp),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return StoreDialog(
                                      title: 'Order Conrfirmation',
                                      description: 'Are you sure to order?',
                                      onSuccessPressed: () {
                                        context.pop();
                                        context
                                            .read<OrderDetailBloc>()
                                            .add(DeleteCartEvent(state.cart));
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
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      Theme.of(context).colorScheme.primary)),
                              child: SizedBox(
                                height: 45,
                                child: Center(
                                  child: Text(
                                    'Checkout Cart',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
