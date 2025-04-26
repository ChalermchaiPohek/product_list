import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_list/modules/category/category_controller.dart';
import 'package:product_list/router/route_path.dart';
import 'package:product_list/util/constants.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesController _controller = Get.find<CategoriesController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("categories_title".tr, style: TextStyle(fontWeight: FontWeight.bold),),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Text("change_language_title".tr),
              UIConst.hDivider,
              ListTile(
                leading: FittedBox(
                  child: Flag.fromString("TH"),
                ),
                title: Text("lang_th".tr),
                onTap: () async {
                  await Get.updateLocale(Locale("th", "TH"));
                },
              ),
              UIConst.hDivider,
              ListTile(
                leading: FittedBox(
                  child: Flag.fromString("US"),
                ),
                title: Text("lang_en".tr),
                onTap: () async {
                  await Get.updateLocale(Locale("en", "US"));
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          final categories = _controller.categories;

          return Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final category = categories.elementAt(index);

                return ListTile(
                  title: Text(category.name ?? ""),
                  onTap: () {
                    Get.toNamed(
                        RoutePath.productListPath,
                        arguments: {
                          "category": category
                        }
                    );
                  },
                );
              },
            ),
          );
        },)
      ],
    );
  }
}
