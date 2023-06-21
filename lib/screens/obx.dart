import 'package:get/get.dart';
import 'package:getx2/model/Ordermodel.dart';

import '../model/Cartitemmodel.dart';


class OrderController extends GetxController {
  var _orders = [].obs;

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        Order(
          
            username: DateTime.now().toString(),
            products: cartProducts,
            amount: total,
            dateTime: DateTime.now().toString(),));
  }
}