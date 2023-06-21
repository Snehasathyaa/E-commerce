// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/Productmodel.dart';

class ProductController extends GetxController {

  
  late List<dynamic> _items=[].obs;

  var isDataLoading = false.obs;



  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}


  getApi() async {
    try{
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('http://192.168.29.59:8080/shopping/getproduct.jsp')!,
          
      );
      if(response.statusCode == 200){
        ///data successfully
        var result = jsonDecode(response.body);
        print(response.body);
        //items =  ProductController.fromJson(result);
        _items=result.map((data) => new Product.fromJson(data)).toList();
        
      }else{
        ///error
      }
    }catch(e){
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    }finally{
      isDataLoading(false);
    }
  }
  
  static ProductController? fromJson(result) {}




    // Product(
    //   id: 1,
    //   productTitle: 'Sport Shoe',
    //   description: 'Made for you Check it out!',
    //   price: 7000.00,
    //   imageUrl:
    //      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYT7kaJxNiqa1wwYmVebZxK0hkZhr4buZpK07-PuQTlbQi1K3JpQVAXzTFq-KBcJKJ3Po&usqp=CAU', 
    // ),
    // Product(
    //     id: 2,
    //     productTitle: 'Legend',
    //     description:
    //         'Built to last forever, StormKing™ lug rubber outsoles and a flexible elastic goring, this can only be for the Legends and i bet you, you have not seen it anywhere.',
    //     price: 63000.00,
    //     imageUrl:
    //         'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-Legend-BlackMatte-3.4_672x672.jpg?v=1600886623'),
    // Product(
    //     id: 3,
    //     productTitle: 'The Chelsea',
    //     description: 'Functional and Fashionable.',
    //     price: 49.00,
    //     imageUrl:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7H2UqWuZNjSEL_8_VZrghL9hIGJ3cez8pNSTemiC36AWVHYVI-Yu67FTicP0brhAutzQ&usqp=CAU'),
    // Product(
    //     id: 4,
    //     productTitle: 'Men\'s Sneakers',
    //     description: 'Clean & Comfortable Sneakers made with classic Leathers.',
    //     price: 49.99,
    //     imageUrl:
    //         'https://rukminim1.flixcart.com/image/432/518/kz5vwy80/shoe/q/k/9/7-sports-running-shoes-7-ratite-green-original-imagb8qeae6vy9k5.jpeg?q=70'),
    // Product(
    //     id: 5,
    //     productTitle: 'The Chelsea',
    //     description:
    //         'Comfortable as you\'d expect.This can only be found at Resilient collection.',
    //     price: 49.99,
    //     imageUrl:
    //         'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Captain-Natural-3.jpg?v=1584114360'),
    // Product(
    //     id: 6,
    //     productTitle: 'Men\'s Sneakers',
    //     description: 'Clean & Comfortable Sneakers made with classic Leathers.',
    //     price: 49.99,
    //     imageUrl:
    //         'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-PremierLowTop-Black-3.4.jpg?v=1600270679'),
    // Product(
    //     id: 7,
    //     productTitle: 'The Chelsea',
    //     description:
    //         'Made for the men who understand what classic means, every bit was carefully selected so you can go the extra mile with confidence and alacrity.',
    //     price: 49.99,
    //     imageUrl:
    //         'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-Cavalier-Toffee-210402-2.jpg?v=1618424894'),
    // Product(
    //     id: 8,
    //     productTitle: 'Men\'s Sneakers',
    //     description: 'Clean & Comfortable Sneakers made with classic Leathers.',
    //     price: 49.99,
    //     imageUrl:
    //         'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-Cavalier-Toffee-210402-3.jpg?v=1618424894'),
    // Product(
    //     id: 9,
    //     productTitle: 'The Chelsea',
    //     description: 'Functional and Fashionable.',
    //     price: 49.99,
    //     imageUrl:
    //         'https://sc04.alicdn.com/kf/Hbc8560b1a2f641149f93f80387cb94111.jpg'),
    // Product(
    //     id: 10,
    //     productTitle: 'Men\'s Sneakers',
    //     description: 'Clean & Comfortable Sneakers made with classic Leathers.',
    //     price: 49.99,
    //     imageUrl:
    //         'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/15461146/2021/12/7/8198188f-5b43-4571-8836-fac58beef9f21638875430363-AfroJack-Men-Green--White-Woven-Design-Sneakers-641638875429-1.jpg'),


  List<Product> get items {
    return [..._items];
  }

  List<dynamic> get favouriteItems {
    return _items.where((productItem) => productItem.isFavourite).toList();
  }

  Product findProductById(int id) {
    return _items.firstWhere((element) => element.id == id);
  }


  void toggleFavouriteStatus(int id) {
    items[id].isFavourite = !items[id].isFavourite;
    update();
  }

  void removeitem(int productId) {}
}