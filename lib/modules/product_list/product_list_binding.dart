import 'package:get/get.dart';
import 'package:product_list/modules/product_list/product_list_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ProductListController.new, fenix: true);
  }

}