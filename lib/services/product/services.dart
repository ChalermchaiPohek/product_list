import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:product_list/models/categories.dart';
import 'package:product_list/models/product_list.dart';
import 'package:product_list/util/constants.dart';

class ProductService extends GetxService {
  Future<List<Categories>> getCategories() async {
    try {
      String url = AppConst.getCategories;
      final response = await http.get(Uri.parse(url));
      final List respData = jsonDecode(response.body);
      return respData.map((e) => Categories.fromJson(e),).toList();
    } catch (error, s) {
      if (kDebugMode) {
        print(s.toString());
      }
      rethrow;
    }
  }


  Future<Products> getProducts(String apiPath) async {
    try {
      final response = await http.get(Uri.parse(apiPath));
      return Products.fromJson(jsonDecode(response.body));
    } catch (error, s) {
      if (kDebugMode) {
        print(s.toString());
      }
      rethrow;
    }
  }
}