import 'package:flutter/material.dart';
import 'package:luan/src/products/services/products_service.dart';
import 'package:luan/src/products/states/product_state.dart';

class ProductStore extends ValueNotifier<ProductState> {
  final ProductService service;

  ProductStore(this.service) : super(InitialProductState());

  Future fetchProducts () async{
    value = LoadingProductState();

    try{
      final products = await service.fetchProducts();
      value = SuccessProductState(products);
    }catch(e){
      value = ErrorProductState(e.toString());
    }
  }
}

