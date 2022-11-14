import 'package:get/state_manager.dart';

class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDesc;
  final double price;

  Product(this.id, this.productName, this.productImage, this.productDesc,
      this.price);
  final isFavorite = false.obs;
}
