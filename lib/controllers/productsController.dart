import 'package:assignment1/api/api.dart';
import 'package:assignment1/models/products.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = <ProductList>[].obs;
  RxBool isLoading = true.obs;

  void onInit() {
    getProducts();
    super.onInit();
  }

  Future getProducts() async {
    try {
      isLoading(true);
      var response = await Api.getProducts();
      if (response.length != 0) {
        productList.assignAll(response);

        print(productList.length);
      }
      isLoading(false);
    } catch (e) {
      print(e);
      throw e;
    } finally {
      isLoading(false);
    }
  }
}
