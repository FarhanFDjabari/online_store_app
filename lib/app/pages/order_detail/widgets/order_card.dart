import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_order_app/app/pages/order_detail/widgets/transaction_item.dart';
import 'package:online_order_app/app/styles/colors.dart';
import 'package:online_order_app/data/models/cart_product.dart';

class OrderCard extends StatelessWidget {
  final List<CartProduct> products;

  const OrderCard({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: ScreenUtil.defaultSize.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Your Order",
            ),
            SizedBox(height: 5.sp),
            Text(
              "${products.length} products",
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.start,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Product',
                    maxLines: 3,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Qty',
                    maxLines: 3,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Price',
                    maxLines: 3,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ],
            ),
            Container(
              width: ScreenUtil.defaultSize.width,
              height: 5,
              color: lightGrey,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  return TransactionItem(
                    imageUrl: null,
                    price: products[index].price.toString(),
                    quantity: products[index].quantity ?? 0,
                    productName: "${products[index].title}",
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: ScreenUtil.defaultSize.width,
                    height: 2,
                    color: lightGrey.withOpacity(0.5),
                  );
                },
                itemCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
