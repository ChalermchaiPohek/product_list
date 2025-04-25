import 'package:get/get.dart';
import 'package:product_list/services/product/services.dart';

class CategoriesController extends GetxController {

  final ProductService _productService = Get.find();

  @override
  void onInit() {
    super.onInit();
    _productService.getCategories();
    _productService.getProducts("https://dummyjson.com/products/category/fragrances").then((value) {
      print(value);
    },);
  }
}