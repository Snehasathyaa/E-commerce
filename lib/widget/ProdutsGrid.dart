import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/ProductController.dart';
import '../screens/Productdetails.dart';
import '../controller/cartcontroller.dart';

class ProductsGrid extends StatelessWidget {
  final controller = Get.put(ProductController());
  final cartController = Get.put(CartController());
  

  @override
  Widget build(BuildContext context) {
    // controller.getApi();
   return Obx(((){
    if (controller.isDataLoading.value){
      return const Center(child: CircularProgressIndicator());
    }else{

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: controller.items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {


        print(controller.items.length);
        return GetBuilder(
          init: ProductController(),
          builder: (value) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: GestureDetector(
                // onTap: () {

                //   Get.to(
                //     ProductDetailsScreen(
                //       controller.items[index].productTitle,
                //       controller.items[index].price,
                //       controller.items[index].imageUrl,
                //       controller.items[index].description,
                //     ),
                //   );
                // },
                child: Image.network(
                  "http://192.168.29.59:8080/shopping/image/"+controller.items[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                leading: IconButton(
                  icon: Icon(
                    controller.items[index].isFavourite == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {


                    log("message");
                    controller.toggleFavouriteStatus(index);
                  },
                ),
                title: Text(
                  controller.items[index].productTitle,
                  textAlign: TextAlign.center,
                ),
                trailing: GetBuilder<CartController>(
                    init: CartController(),
                    builder: (cont) {
                      return IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          cartController.addItem(
                              controller.items[index].id,
                              controller.items[index].price,
                              controller.items[index].productTitle,
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
    );
    }
  })
  );

  }
}