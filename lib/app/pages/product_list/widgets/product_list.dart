import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:online_order_app/app/pages/product_list/widgets/product_item.dart';
import 'package:online_order_app/app/routes/route_path.dart';
import 'package:online_order_app/data/models/product_model.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> products;
  final Map<String, int> selectedProducts;
  final ValueChanged<String> onAddQty;
  final ValueChanged<String> onSubsQty;

  const ProductList({
    Key? key,
    required this.products,
    this.selectedProducts = const {},
    required this.onAddQty,
    required this.onSubsQty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.defaultSize.width,
      child: ListView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemBuilder: (context, index) {
          return ProductItem(
            imageUrl: "${products[index].images?.first}",
            title: "${products[index].title}",
            price: "\$${products[index].price}",
            qty: '${selectedProducts[products[index].id] ?? 0}',
            onTap: () =>
                context.go('${RoutePath.productList}/${products[index].id}'),
            onAddQty: () {
              onAddQty(products[index].id.toString());
            },
            onSubQty: () {
              onSubsQty(products[index].id.toString());
            },
          );
        },
      ),
    );
  }
}
