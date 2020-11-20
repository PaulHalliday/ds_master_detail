import 'package:dartz/dartz.dart';
import 'package:ds_master_detail/src/constants/product.dart';
import 'package:ds_master_detail/src/models/product_detail_args.dart';
import 'package:ds_master_detail/src/models/product_model.dart';
import 'package:ds_master_detail/src/pages/product_detail_page.dart';

import 'package:ds_master_detail/src/services/product_service.dart';
import 'package:ds_master_detail/src/widgets/error_message.dart';
import 'package:ds_master_detail/src/widgets/loading.dart';
import 'package:ds_master_detail/src/widgets/product_list.dart';

import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  static const routeName = "/products";
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Master Page"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Direct Navigation"),
        onPressed: () => Navigator.of(context).pushNamed(
          ProductDetailPage.routeName,
          arguments: ProductDetailArgs(
            Right(kProductList.length + 5),
          ),
        ),
      ),
      body: FutureBuilder(
        future: _productService.getProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasError) {
            return ErrorMessage(snapshot.error);
          }

          if (snapshot.hasData) {
            return ProductList(
              productList: snapshot.data,
              onTap: (Product product) => Navigator.of(context).pushNamed(
                ProductDetailPage.routeName,
                arguments: ProductDetailArgs(
                  Left(product),
                ),
              ),
            );
          }

          return Loading();
        },
      ),
    );
  }
}
