import 'package:ds_master_detail/src/models/product_detail_args.dart';
import 'package:ds_master_detail/src/models/product_model.dart';
import 'package:ds_master_detail/src/services/product_service.dart';
import 'package:ds_master_detail/src/widgets/error_message.dart';
import 'package:ds_master_detail/src/widgets/loading.dart';

import 'package:ds_master_detail/src/widgets/product_detail.dart';
import 'package:flutter/material.dart';

extension ToProductService on int {
  Future<Product> toProduct() async {
    final ProductService _productService = ProductService();
    final productId = this;

    return _productService.getProductById(productId);
  }
}

class ProductDetailPage extends StatelessWidget {
  static const routeName = "/products/detail";

  const ProductDetailPage();

  @override
  Widget build(BuildContext context) {
    final ProductDetailArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),
      body: args.selectedProductOrId.fold(
        _buildFromProduct,
        _buildFromInt,
      ),
    );
  }

  Widget _buildFromProduct(Product product) {
    return ProductDetail(product: product);
  }

  Widget _buildFromInt(int productId) {
    return FutureBuilder(
      future: productId.toProduct(),
      builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
        if (snapshot.hasError) {
          return ErrorMessage(snapshot.error);
        }

        if (snapshot.hasData) {
          return ProductDetail(product: snapshot.data);
        }

        return Loading();
      },
    );
  }
}
