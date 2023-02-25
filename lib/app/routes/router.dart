import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:online_order_app/app/pages/order/order_screen.dart';
import 'package:online_order_app/app/pages/order_detail/order_detail_screen.dart';
import 'package:online_order_app/app/pages/product_detail/product_detail_screen.dart';
import 'package:online_order_app/app/pages/product_list/product_list_screen.dart';
import 'package:online_order_app/app/pages/splash/splash_screen.dart';
import 'package:online_order_app/app/pages/transaction_result/transaction_result_screen.dart';
import 'package:online_order_app/app/routes/route_name.dart';
import 'package:online_order_app/app/routes/route_path.dart';
import 'package:online_order_app/data/models/cart_model.dart';

final router = GoRouter(
  initialLocation: RoutePath.splashScreen,
  debugLogDiagnostics: !kReleaseMode,
  routes: [
    GoRoute(
      path: RoutePath.splashScreen,
      name: RouteName.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutePath.productList,
      name: RouteName.productList,
      builder: (context, state) => ProductListScreen(),
      routes: [
        GoRoute(
          path: RoutePath.productDetail,
          name: RouteName.productDetail,
          builder: (context, state) => ProductDetailScreen(
            productId: "${state.params['productId']}",
          ),
        ),
      ],
    ),
    GoRoute(
      path: RoutePath.order,
      name: RouteName.order,
      builder: (context, state) => OrderScreen(),
      routes: [
        GoRoute(
          path: RoutePath.orderDetail,
          name: RouteName.orderDetail,
          builder: (context, state) => OrderDetailScreen(
            orderId: "${state.params['orderId']}",
          ),
          routes: [
            GoRoute(
              path: RoutePath.transactionResult,
              name: RouteName.transactionResult,
              builder: (context, state) => TransactionResultScreen(
                cart: state.extra as CartModel,
                orderId: "${state.params['orderId']}",
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
