import 'package:ds_master_detail/src/pages/product_detail_page.dart';
import 'package:ds_master_detail/src/pages/product_list_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Master > Detail',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: ProductListPage.routeName,
      routes: {
        ProductListPage.routeName: (context) => ProductListPage(),
        ProductDetailPage.routeName: (context) => ProductDetailPage(),
      },
    );
  }
}
