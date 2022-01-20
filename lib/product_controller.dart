import 'package:get/get.dart';
import 'package:getx_shoping/model.dart';
import 'package:getx_shoping/remote.dart';

class ProductController extends GetxController {
  var productsList = <Cosmetics>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServies.fetchProducts();
      if (products != null) {
        productsList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
