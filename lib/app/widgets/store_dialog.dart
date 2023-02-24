import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreDialog extends StatelessWidget {
  const StoreDialog({
    Key? key,
    this.onSuccessPressed,
    this.onCancelPressed,
    this.title,
    this.description,
    this.successButtonLabel,
    this.cancelButtonLabel,
  }) : super(key: key);

  final Function()? onSuccessPressed;
  final Function()? onCancelPressed;
  final String? title;
  final String? description;
  final String? successButtonLabel;
  final String? cancelButtonLabel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 328,
        height: 140,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$title",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              "$description",
              maxLines: 2,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onCancelPressed,
                  child: Text(
                    "$cancelButtonLabel",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                SizedBox(width: 5.sp),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                  ),
                  onPressed: onSuccessPressed,
                  child: Text(
                    "$successButtonLabel",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.background,
                        ),
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
