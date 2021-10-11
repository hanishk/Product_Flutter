import 'package:assignment1/config/colors.dart';
import 'package:assignment1/controllers/cartController.dart';
import 'package:assignment1/controllers/productsController.dart';
import 'package:assignment1/views/cart/cart.dart';
import 'package:assignment1/views/home/productTile.dart';
import 'package:assignment1/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final productController = Get.put(ProductController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, title: "Products", actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CartScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart_outlined),
                Obx(() {
                  return Text(cartController.count.toString());
                })
              ],
            ),
          ),
        ),
      ]),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              return ProductTile(
                productList: productController.productList[index],
              );
            },
          );
        }
      }),
      bottomNavigationBar: Stack(
        children: [
          new Container(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Positioned(
              left: 0.0,
              right: 0.0,
              top: 0.0,
              bottom: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                color: redAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Total Amount: ',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Obx(() {
                        return Text(
                          '\$${cartController.totalPrice}',
                        );
                      }),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
