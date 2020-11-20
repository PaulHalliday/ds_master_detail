import 'package:dartz/dartz.dart';
import 'package:ds_master_detail/src/models/product_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class ProductDetailArgs {
  final Either<Product, int> selectedProductOrId;

  const ProductDetailArgs(this.selectedProductOrId);
}
