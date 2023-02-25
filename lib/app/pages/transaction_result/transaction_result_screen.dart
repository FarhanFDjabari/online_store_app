import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:online_order_app/app/pages/transaction_result/bloc/transaction_result_bloc.dart';
import 'package:online_order_app/app/pages/transaction_result/widgets/transaction_card.dart';
import 'package:online_order_app/app/routes/route_name.dart';
import 'package:online_order_app/app/routes/route_path.dart';
import 'package:online_order_app/data/models/cart_model.dart';
import 'package:online_order_app/injection.dart';

class TransactionResultScreen extends StatelessWidget {
  final String orderId;
  final CartModel cart;

  const TransactionResultScreen(
      {required this.orderId, required this.cart, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionResultBloc>(
      create: (context) => getIt<TransactionResultBloc>()
        ..add(LoadTransactionResultEvent(int.parse(orderId), cart)),
      child: Builder(builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            context.go(RoutePath.productList);

            return false;
          },
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onBackground),
              automaticallyImplyLeading: false,
              title: Text(
                'Transaction',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: BlocBuilder<TransactionResultBloc,
                      TransactionResultState>(
                    builder: (context, state) {
                      if (state is TransactionResultLoaded) {
                        return TransactionCard(
                          cart: state.cart,
                        );
                      } else if (state is TransactionResultError) {
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
                  child: ElevatedButton(
                    onPressed: () {
                      context.goNamed(RouteName.productList);
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.primary)),
                    child: SizedBox(
                      height: 45,
                      child: Center(
                        child: Text(
                          'Return to Home',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.background,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
