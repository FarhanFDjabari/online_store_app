import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_order_app/app/pages/splash/bloc/splash_bloc.dart';
import 'package:online_order_app/app/routes/route_name.dart';
import 'package:online_order_app/injection.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (_) => getIt<SplashBloc>()..add(SplashStart()),
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (blocContext, state) {
          if (state is SplashLoading) {
            blocContext.read<SplashBloc>().add(SplashEnd());
          }
          if (state is SplashFinished) {
            context.goNamed(RouteName.productList);
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircularProgressIndicator.adaptive(),
              ],
            ),
          );
        },
      ),
    );
  }
}
