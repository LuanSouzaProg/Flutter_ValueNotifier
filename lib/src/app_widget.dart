import 'package:flutter/material.dart';
import 'package:luan/src/products/product_page.dart';
import 'package:luan/src/products/services/products_service.dart';
import 'package:luan/src/products/stores/product_store.dart';
import 'package:provider/provider.dart';
import 'package:uno/uno.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Uno()),
        Provider(create: (context) => ProductService(context.read())),
        ChangeNotifierProvider(create: (context) => ProductStore(context.read()))
      ],
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductPage(),
      ),
    );
  }
}