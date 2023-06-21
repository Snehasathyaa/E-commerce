import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx2/widget/wishlist.dart';
import '../widget/Appdrawer.dart';
import '../widget/badge.dart';
import 'CartScreen.dart';
import '../widget/ProdutsGrid.dart';
import '../controller/cartcontroller.dart';

class ProductOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        actions: <Widget>[
           IconButton(
                      icon: Icon(
                        Icons.favorite,
                      ),
                      onPressed: () {
                        Get.to(() => wishlist());
                      }),
             
          GetBuilder<CartController>(
              init: CartController(),
              builder: (contex) {
                return Badge(
                  child: IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                      ),
                      onPressed: () {
                        Get.to(() => CartScreen());
                      }),
                  value: cartController.itemCount.toString(),
                  color: Theme.of(context).accentColor,
                );
             
              }),
                      
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(),
    );
  }
}