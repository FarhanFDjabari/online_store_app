import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:online_order_app/app/pages/order/bloc/order_bloc.dart';
import 'package:online_order_app/app/pages/order/widgets/cart_item.dart';
import 'package:online_order_app/app/routes/route_path.dart';
import 'package:online_order_app/injection.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderBloc>(
      create: (context) => getIt<OrderBloc>()..add(LoadAllOrderEvent()),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.onBackground),
          title: Text(
            'My Cart',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              if (state is OrderLoaded) {
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
                  itemCount: state.carts.length,
                  itemBuilder: (context, index) {
                    final cart = state.carts[index];
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
                      onDelete: () {},
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
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
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
  }
}
