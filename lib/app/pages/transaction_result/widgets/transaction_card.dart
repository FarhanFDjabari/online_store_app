import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_order_app/app/pages/order_detail/widgets/transaction_item.dart';
import 'package:online_order_app/app/styles/colors.dart';
import 'package:online_order_app/data/models/cart_model.dart';

class TransactionCard extends StatelessWidget {
  final CartModel cart;

  const TransactionCard({
    super.key,
    required this.cart,
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
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 150.sp,
            ),
            Text(
              'Order Success 👍',
            ),
            SizedBox(height: 50.sp),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Transaction ID: ${cart.id}",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            SizedBox(height: 5.sp),
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
                    price: '${cart.products?[index].price}',
                    quantity: cart.products?[index].quantity ?? 0,
                    productName: "${cart.products?[index].title}",
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: ScreenUtil.defaultSize.width,
                    height: 2,
                    color: lightGrey.withOpacity(0.5),
                  );
                },
                itemCount: cart.products?.length ?? 0,
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Total Price',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    '\$${cart.total}',
                    maxLines: 2,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
