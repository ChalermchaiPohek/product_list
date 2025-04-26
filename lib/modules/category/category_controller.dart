import 'package:get/get.dart';
import 'package:product_list/models/categories.dart';
import 'package:product_list/services/product/services.dart';

class CategoriesController extends GetxController {

  final ProductService _productService = Get.find();

  final RxList<Categories> _categories = RxList<Categories>([]);
  List<Categories> get categories => _categories;

  @override
  void onInit() {
    super.onInit();
    _productService.getCategories().then(_categories.call);
  }
}