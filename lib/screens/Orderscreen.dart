import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx2/controller/OrderController.dart';

import '../widget/Appdrawer.dart';
import '../widget/Orderitem.dart';

class OrderScreen extends StatelessWidget {
  var orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yours Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (context, index) =>
              OrderItem(orderController.orders[index])),
    );
  }
}