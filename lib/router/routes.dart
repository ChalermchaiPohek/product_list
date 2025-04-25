import 'package:get/get.dart';
import 'package:product_list/modules/category/category_binding.dart';
import 'package:product_list/modules/category/category_view.dart';
import 'package:product_list/modules/product_list/product_list_binding.dart';
import 'package:product_list/modules/product_list/product_list_view.dart';
import 'package:product_list/router/route_path.dart';

abstract class Routes {
  static List<GetPage> routers = [
    GetPage(
      name: RoutePath.categoriesPath,
      page: CategoriesScreen.new,
      transition: Transition.native,
      binding: CategoriesBinding()
    ),
    GetPage(
      name: RoutePath.productListPath,
      page: ProductListScreen.new,
      transition: Transition.native,
      binding: ProductListBinding()
    ),
  ];
}