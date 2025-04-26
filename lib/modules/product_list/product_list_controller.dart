import 'package:get/get.dart';
import 'package:product_list/models/product_list.dart';
import 'package:product_list/services/product/services.dart';

class ProductListController extends GetxController {

  final ProductService _productService = Get.find();

  final Rxn<Products> _products = Rxn(null);
  Products? get products => _products.value;

  Future getProducts(String url) async {
    try {
      if (url.isEmpty) {
        return;
      }

      return _productService.getProducts(url).then(_products.call);
    } catch (error, s) {
      print(s.toString());
      rethrow;
    }
  }
}