import 'package:assignment1/controllers/cartController.dart';
import 'package:assignment1/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, title: "Cart"),
      body: ListView.builder(
        itemCount: cartController.cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(cartController
              .cartItems[index].productVariants![index].variantValue!);
        },
      ),
    );
  }
}
