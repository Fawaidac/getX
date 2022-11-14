import 'package:flutter/material.dart';
import 'package:getx/controller/purchase.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getx/controller/demoController.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_core/get_core.dart';

class HomePage extends StatelessWidget {
  final purchase = Get.put(Purchase());
  DemoController cart = Get.find();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Home'),
      ),
      bottomSheet: SafeArea(
          child: Card(
        elevation: 12.0,
        margin: EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          height: 65,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 40,
                      color: Colors.white,
                    ),
                    Positioned(
                      right: 5,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: Center(
                            child: GetX<DemoController>(builder: (controller) {
                          return Text(
                            '${controller.cartCount}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 11),
                          );
                        })),
                      ),
                    ),
                  ],
                ),
                GetX<DemoController>(builder: (controller) {
                  return Text(
                    'Total Amount : ${controller.totalAmount}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16),
                  );
                }),
                IconButton(
                    onPressed: () => Get.toNamed('/cart',
                        arguments:
                            "HomePage To Demo Page -> PAssing arguments"),
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      )),
      body: Container(
        child: GetX<Purchase>(builder: (controller) {
          return ListView.builder(
            itemCount: controller.product.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  children: [
                    // Image.network(
                    //   'https://img.alic.com/tfs/TB1e.XyRel2gK0jSZFmXXc7iXXa-900-400.png',
                    //   fit: BoxFit.cover,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.product[index].productName,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                controller.product[index].productDesc,
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12),
                              ),
                              Text(
                                '\$${controller.product[index].price}',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        )),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: ElevatedButton(
                              onPressed: () =>
                                  cart.addToCart(controller.product[index]),
                              child: const Text(
                                'Shop Now',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12),
                              )),
                        ),
                        Obx(() => IconButton(
                              icon: controller.product[index].isFavorite.value
                                  ? Icon(Icons.check_box_rounded)
                                  : Icon(
                                      Icons.check_box_outline_blank_outlined),
                              onPressed: () {
                                controller.product[index].isFavorite.toggle();
                              },
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
