import 'package:flutter/material.dart';
import 'package:luan/src/products/services/products_service.dart';
import 'package:luan/src/products/states/product_state.dart';
import 'package:luan/src/products/stores/product_store.dart';
import 'package:uno/uno.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final store = ProductStore(ProductService(Uno()));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Page"),
      ),
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (_, state, child) {
          if (state is LoadingProductState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ErrorProductState) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is SuccessProductState) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (_, index) {
                final products = state.products[index];
                return ListTile(
                  title: Text(products.title),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
