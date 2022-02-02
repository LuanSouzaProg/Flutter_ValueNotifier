import 'package:luan/src/products/models/product_model.dart';
import 'package:uno/uno.dart';

class ProductService {

  final Uno uno;

  ProductService(this.uno);

  Future<List<ProductModel>> fetchProducts() async{
    //falta passar a URL do dartion
    final response = await uno.get("url");

    final list = response.data as List;

    final products = list.map((e) => ProductModel.fromMap(e)).toList();

    return products;
  }
}