import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/ProductController.dart';
import '../controller/cartcontroller.dart';
import '../screens/Productdetails.dart';

class wishlist extends StatelessWidget {
    final controller = Get.put(ProductController());
  final cartController = Get.put(CartController());

  
  //get cartController => null;

  @override
  Widget build(BuildContext context) {
  
     return Scaffold(  
      appBar: AppBar(  
        title: Text("Wishlist"),  
        backgroundColor: Colors.purple,  
      ),  
      body: Center(  
          child: GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: controller.favouriteItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return GetBuilder(
          init: ProductController(),
          builder: (value) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    ProductDetailsScreen(
                      controller.favouriteItems[index].productTitle,
                      controller.favouriteItems[index].price,
                      controller.favouriteItems[index].imageUrl,
                      controller.favouriteItems[index].description,
                    ),
                  );
                },
                child: Image.network(
                 "http://192.168.29.59:8080/shopping/image/"+ controller.favouriteItems[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                leading: IconButton(
                  icon: Icon(
                    controller.favouriteItems[index].isFavourite == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {


                    //log("message");
                    controller.toggleFavouriteStatus(index);
                  },
                ),
                title: Text(
                  controller.favouriteItems[index].productTitle,
                  textAlign: TextAlign.center,
                ),
                trailing: GetBuilder<CartController>(
                    init: CartController(),
                    builder: (cont) {
                      return IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          cartController.addItem(
                              controller.favouriteItems[index].id,
                              controller.favouriteItems[index].price,
                              controller.favouriteItems[index].productTitle,
                              1);
                        },
                        color: Theme.of(context).accentColor,
                      );
                    }),
        )
            )
          )
        );
      },
    )
    )
    );
  }
}