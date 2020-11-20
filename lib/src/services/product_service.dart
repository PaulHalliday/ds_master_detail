import 'dart:math';

import 'package:ds_master_detail/src/constants/product.dart';
import 'package:ds_master_detail/src/models/product_model.dart';

class NetworkException {
  final String message;

  NetworkException(this.message);
}

class ProductService {
  Future<List<Product>> getProducts() async {
    try {
      await _shouldError("Couldn't fetch product list.");

      return kProductList;
    } on NetworkException catch (e) {
      return Future.error(e.message);
    }
  }

  Future<Product> getProductById(int id) async {
    try {
      await _shouldError("Couldn't fetch product by ID.");

      return kProductList.firstWhere(
        (element) => element.id == id,
        orElse: () => throw NetworkException("Couldn't fetch product by ID."),
      );
    } on NetworkException catch (e) {
      return Future.error(e.message);
    }
  }

  Future<void> _shouldError(String errorMessage) async {
    final error = false;

    return error
        ? Future.delayed(Duration(seconds: 1),
            () => Future.error(NetworkException(errorMessage)))
        : Future.delayed(Duration(seconds: 1), null);
  }
}
