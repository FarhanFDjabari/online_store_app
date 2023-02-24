import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionItem extends StatelessWidget {
  final String? imageUrl;
  final String productName;
  final int quantity;
  final String price;

  const TransactionItem({
    super.key,
    this.imageUrl,
    required this.productName,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (imageUrl != null)
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.network(
                "$imageUrl",
                fit: BoxFit.cover,
              ),
            ),
          ),
        SizedBox(width: 5.sp),
        Expanded(
          flex: 5,
          child: Text(
            productName,
            maxLines: 3,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontSize: 24.sp),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'x$quantity',
            maxLines: 3,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontSize: 24.sp),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '\$$price',
            maxLines: 3,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontSize: 24.sp),
          ),
        ),
      ],
    );
  }
}
