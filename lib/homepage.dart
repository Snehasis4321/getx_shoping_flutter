import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_shoping/product_controller.dart';
import 'package:getx_shoping/product_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_outlined),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                    child: Text(
                  "Shop Us",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                )),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.view_list),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view))
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () {
                return productController.isLoading.value == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : AlignedGridView.count(
                        crossAxisCount: 2,
                        itemCount: productController.productsList.length,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        itemBuilder: (context, index) {
                          return Container(
                            // height: 200,
                            // width: 100,
                            // color: Colors.blue,
                            child: CosmeticsView(
                                cosmetics:
                                    productController.productsList[index]),
                          );
                        },
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
