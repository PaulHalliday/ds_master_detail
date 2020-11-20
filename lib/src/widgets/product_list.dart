import 'package:ds_master_detail/src/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key key,
    @required this.productList,
    @required this.onTap,
  }) : super(key: key);

  final List<Product> productList;
  final Function(Product) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        final product = productList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: ListTile(
            title: Text(product.title),
            subtitle: Text(product.description(shortened: true)),
            onTap: () => onTap(product),
          ),
        );
      },
    );
  }
}
