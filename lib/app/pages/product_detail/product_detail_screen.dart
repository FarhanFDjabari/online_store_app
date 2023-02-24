import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:online_order_app/injection.dart';

import 'bloc/product_detail_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductDetailBloc>()
        ..add(LoadProductDetailEvent(int.parse(productId))),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white.withOpacity(0.8)),
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                splashColor:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                onTap: () => context.pop(),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            ),
          ),
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
        ),
        body: BlocListener<ProductDetailBloc, ProductDetailState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<ProductDetailBloc, ProductDetailState>(
                builder: (context, state) {
                  if (state is ProductDetailLoaded) {
                    return Image.network(
                      "${state.product.images?.first}",
                      fit: BoxFit.cover,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              Container(
                width: ScreenUtil.defaultSize.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                  builder: (context, state) {
                    if (state is ProductDetailLoaded) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.sp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "${state.product.title}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          fontSize: 30.sp,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "\$${state.product.price}",
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.sp),
                            Text(
                              "${state.product.description}",
                              maxLines: 10,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                      fontSize: 24.sp, color: Colors.grey),
                            ),
                            SizedBox(height: 40.sp),
                            Text(
                              'Rating',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                            ),
                            const SizedBox(height: 5),
                            RatingBar.builder(
                              onRatingUpdate: (_) {},
                              itemCount: 5,
                              initialRating: state.product.rating ?? 0.0,
                              itemSize: 55.sp,
                              ignoreGestures: true,
                              allowHalfRating: true,
                              direction: Axis.horizontal,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ),
                          ],
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
            ],
          ),
        ),
      ),
    );
  }
}
