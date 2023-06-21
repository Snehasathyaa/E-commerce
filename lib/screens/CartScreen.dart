import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/OrderController.dart';
import '../controller/cartcontroller.dart';
import '../model/Ordermodel.dart';
import '../widget/Cartitem.dart';


class CartScreen extends StatelessWidget {
  var orderController = Get.put(OrderController());
    

  @override
  Widget build(BuildContext context) {
    var   cartController = Get.put(CartController());
    var orderController = Get.put(OrderController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Your cart"),
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (cont) => Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        '\u20B9${cartController.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    GetBuilder<OrderController>(
                        init: OrderController(),
                        builder: (context) {
                          return TextButton(
                            
                              onPressed: () {
 Order newOrder=Order(username: "abc",products: cartController.items.values.toList(),amount: cartController.totalAmount,dateTime: DateTime.now().toString() );                                

                                orderController.getcheckout(newOrder); 

                                // orderController.addOrder(
                                //     cartController.items.values.toList(),
                                //     cartController.totalAmount);
                                cartController.clear();


                                Get.snackbar(
                                  "Orders",
                                  "Orders placed successfully",
                                  backgroundColor: Colors.green,
                                  snackPosition: SnackPosition.BOTTOM
                                );
                              },
                              child: Text('ORDER NOW'));
                        })
                  ],
                ),
              ),
            ),
             SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cartController.items.length,
                  itemBuilder: (context, index) => 
                  // CartItem(id, price, quantity, title, productId, id: id, price: price, quantity: quantity, title: title)
                  CartItem(
                       cartController.items.values.toList()[index].id.toString(),
                        cartController.items.values.toList()[index].productPrice,
                        cartController.items.values.toList()[index].productQuantity,
                        cartController.items.values.toList()[index].productTitle,
                        cartController.items.keys.toList()[index], productPrice: null, productQuantity: null, productTitle: null,
                        //  title: '', price: null, quantity: null,
                      )
                      ),
            ),
          ],
        ),
      ),
    );
  }
}