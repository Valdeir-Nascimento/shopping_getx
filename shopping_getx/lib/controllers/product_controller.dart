import 'package:get/state_manager.dart';
import 'package:shoppinggetx/models/product.dart';
import 'package:shoppinggetx/providers/api_provider.dart';

class ProductController extends GetxController {
  // ProductController() {
  //   getProducts();
  // }

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  var productList = List<Product>().obs;

  Future<void> getProducts() async {
    try {
      isLoading(true);
      var products = await ApiProvider.getProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
