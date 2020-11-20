import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

extension PrintDate on DateTime {
  String toNiceString() {
    return "${this.year}/${this.month}/${this.day}";
  }
}

@immutable
class Product {
  final int id;
  final String title;

  final DateTime _dateCreated;
  String get dateCreated => _dateCreated.toNiceString();

  final String _description;
  String description({bool shortened = false}) => shortened
      ? _description.replaceRange(
          _description.length > 150 ? 150 : _description.length,
          _description.length,
          "...")
      : _description;

  const Product({
    @required this.id,
    @required this.title,
    @required String description,
    @required DateTime dateCreated,
  })  : _dateCreated = dateCreated,
        _description = description;

  @override
  String toString() {
    return "Product $id: $title";
  }
}
