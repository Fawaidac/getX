import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx/model/product.dart';

class Purchase extends GetxController {
  var product = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    //Call from server End
    var serverResponse = [
      Product(
          1, "Name Product", "gambar1", "This is description product", 2000),
      Product(
          2, "Name Product", "gambar2", "This is description product", 4000),
      Product(
          3, "Name Product", "gambar3", "This is description product", 2500),
      Product(
          4, "Name Product", "gambar4", "This is description product", 1000),
      Product(
          5, "Name Product", "gambar5", "This is description product", 5000),
      Product(
          6, "Name Product", "gambar6", "This is description product", 4000),
    ];
    product.value = serverResponse;
  }
}
