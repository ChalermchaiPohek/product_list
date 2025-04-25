import 'package:get/get.dart';
import 'package:product_list/modules/category/category_controller.dart';
import 'package:product_list/services/product/services.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CategoriesController.new, fenix: true);
    Get.lazyPut(ProductService.new, fenix: true);
  }

}