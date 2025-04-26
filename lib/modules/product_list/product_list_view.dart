import 'package:cached_network_image/cached_network_image.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_list/models/categories.dart';
import 'package:product_list/modules/product_list/product_list_controller.dart';
import 'package:product_list/util/constants.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListController _controller = Get.find<ProductListController>();
  final Categories _category = Get.arguments["category"];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller.getProducts(_category.url ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        title: Text(_category.name ?? "", style: TextStyle(fontWeight: FontWeight.bold),),
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.back();
          },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          final productItems = _controller.products?.products;

          if (productItems == null) {
            return Center(child: CupertinoActivityIndicator());
          }

          return Expanded(
            child: ListView.builder(
              itemCount: productItems.length,
              shrinkWrap: true,

              itemBuilder: (context, index) {
                final product = productItems.elementAt(index);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: product.thumbnail ?? "",
                            )
                          ],
                        ),
                      ),
                      UIConst.vDivider,
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Text(
                                product.title ?? "",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                product.description ?? "",
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },)
      ],
    );
  }
}
