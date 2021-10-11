import 'package:assignment1/controllers/cartController.dart';
import 'package:assignment1/models/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatefulWidget {
  ProductTile({required this.productList, Key? key}) : super(key: key);
  final ProductList productList;

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  final cartController = Get.put(CartController());

  bool isChecked = false;
  var _value = 1;
  var varientVal = 1;
  int k = 1;

  @override
  Widget build(BuildContext context) {
    final sizedBox = const SizedBox(height: 12);
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.productList.name!),
                    sizedBox,
                    Text(
                      widget.productList.unitprice!,
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough),
                    ),
                    sizedBox,
                    Text(widget.productList.sp.toString()),
                    sizedBox,
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    cartController.addToCart(widget.productList);
                  },
                  icon: const Icon(Icons.add),
                ),
                Obx(() => Text('${widget.productList.count}')),
                IconButton(
                  onPressed: () {
                    cartController.removeFromCart(widget.productList);
                  },
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
            sizedBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: widget.productList.productVariants!.map((e) {
                    return Row(
                      children: [
                        e.variantType! == "color"
                            ? Row(
                                children: [
                                  Checkbox(
                                      value: isChecked,
                                      onChanged: (bool? isTrue) {
                                        setState(() {
                                          this.isChecked = isTrue!;
                                        });
                                      }),
                                  Text(
                                    "${e.variantValue!}",
                                    style: const TextStyle(fontSize: 16),
                                  )
                                ],
                              )
                            : Container(),
                      ],
                    );
                  }).toList(),
                ),
                Row(
                  children: widget.productList.productVariants!.map((e) {
                    // e.productId = e.productId! + 1;
                    return Row(
                      children: [
                        e.variantType! == "size"
                            ? Row(
                                children: [
                                  Radio(
                                    groupValue: varientVal,
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value as int;
                                      });
                                    },
                                    value: e.variantValue!,
                                  ),
                                  // Checkbox(
                                  //     value: isChecked,
                                  //     onChanged: (bool? isTrue) {
                                  //       setState(() {
                                  //         this.isChecked = isTrue!;
                                  //       });
                                  //     }),
                                  Text(
                                    "${e.variantValue}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    );
                  }).toList(),
                ),
                Row(
                  children: widget.productList.productAccessories!.map((e) {
                    return Row(
                      children: [
                        Radio(
                          value: e.accessoriesId!,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value as int;
                            });
                          },
                        ),
                        Text(
                          "${e.name}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
