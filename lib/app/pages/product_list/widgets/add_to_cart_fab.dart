import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_order_app/app/styles/colors.dart';

class AddToCartFab extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isEnable;

  const AddToCartFab({
    super.key,
    this.onPressed,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnable ? onPressed : null,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(
          isEnable ? Theme.of(context).colorScheme.primary : lightGrey,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
      child: SizedBox(
        width: ScreenUtil.defaultSize.width,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add_shopping_cart_rounded,
              color: Theme.of(context).colorScheme.background,
            ),
            SizedBox(width: 10.sp),
            Text(
              'Add To Cart',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
