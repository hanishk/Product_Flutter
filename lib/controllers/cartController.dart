import 'package:assignment1/models/products.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <ProductList>[].obs;
  int get count => cartItems.length;
  int get totalPrice => cartItems.fold(0, (sum, item) => sum + item.sp!);

  addToCart(ProductList product) {
    cartItems.add(product);
    product.count.value++;
  }

  removeFromCart(ProductList product) {
    cartItems.remove(product);
    if (product.count > 0) product.count.value--;
  }
}
