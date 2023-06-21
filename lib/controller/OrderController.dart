import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import '../model/Ordermodel.dart';

class OrderController extends GetxController {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }


Future<Map<String, dynamic>> getcheckout(Order check) async {
    
    print("checkout=="+check.toJson().toString());

    String Url = "http://192.168.29.59:8080/shopping/order.jsp";
  //  String jsonData = jsonEncode(check);
    var body = jsonEncode({'username': 'abc', 'products': [], 'amount': 1500.0 ,'dateTime': '2022-09-22 13:21:04.726363'});
    body=jsonEncode(check);
    final Map<String, dynamic> checkData = {
      
      'order': body

      ///  'shopid': shopid,
    };
    // print("qqqqqqqqqqqqqqqqqqqq");
    final response = await http.post(Uri.parse(Url),
    headers: {"Content-Type": "application/json"},
        body: body,
         );

    print(response.statusCode);
    var result;
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print("Msg rsponse==" + response.body);

    //   var userData = responseData;

    //   print(userData);

    //   checkoutmodel ws = checkoutmodel.fromJson(userData);

    //   result = {'status': true, 'message': 'Successful', 'user': ws};

    //   print("web res>>>>>>>>>" + result.toString());
    // } else {
    //   result = {
    //     'status': false,
    //     'message': json.decode(response.body)['error']
    //   };
     }
    return result;
    //   print("inside 200 :" + response.body.toString());

    //   final Iterable json = jsonDecode(re
    // sponse.body);
    //   return json.map((item) => checkoutmodel.fromJson(item));
    // } else {
    //   throw Exception(" Unable to perform request");
  }



















// Future checkout(Order order)async{
//  log("second"); 
//     try{

//       String jsonData = jsonEncode(order);
//       final Map<String,dynamic> orderDatas={
//             "ordere":order.toString()
//     };

// //String jsonData = jsonEncode(orderDatas);
    
//     final response = await http.post(
//       //ipconfig
//       Uri.parse("http://192.168.29.52:8080/getx/order.jsp"),
//       body: jsonData,
//       headers: {'Content-Type': 'application/json'}
//     );
//     if (response.statusCode == 200) {

//     var result;
//     log("response==="+response.body);
//     var data = jsonDecode(response.body.toString());
   
//         String msg = data['msg'];
//         String username = data['username'];
        

//         if(msg.contains("success")){

//           //navigate to login page or homepage
    
//         }
//         else{
          
//           //failed to login check username,password
//         }
//   }
//   else {
//     throw Exception('Failed to load details of users');
//   }
//   }catch(e){
//     print(e);
//   }
//   }


  // void addOrder(List<CartItem> cartProducts, double total) {
  //   _orders.insert(
  //       0,
  //       Order(
            
  //           orderId: DateTime.now().toString(),
  //           products: cartProducts,
  //           amount: total,
  //           dateTime: DateTime.now()));
  //   update();
  // }
}












// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;

// import 'package:get/get.dart';
// import 'package:getx2/model/Cartitemmodel.dart';

// import '../model/Ordermodel.dart';

// class OrderController extends GetxController {
//   List<Order> _orders = [];

//   List<Order> get orders {
//     return [..._orders];
//   }
  
// Future checkout(Order order)async{

//   log("message");
   
//     try{
//       final Map<String,dynamic> orderDatas={
//             "order":order.toString()
//     };
//     final response = await http.post(
//       //ipconfig
//       Uri.parse("http://192.168.29.59:8080/shopping/order.jsp"),
//       body: orderDatas,
//       //headers: {'Content-Type': 'application/json'}
//     );
//     if (response.statusCode == 200) {

//     var result;
//     log("response==="+response.body);
//     var data = jsonDecode(response.body.toString());
   
//         String msg = data['msg'];
//         String username = data['username'];
        

//         if(msg.contains("success")){

//           //navigate to login page or homepage
    
//         }
//         else{
          
//           //failed to login check username,password
//         }
//   }
//   else {
//     throw Exception('Failed to load details of users');
//   }
//   }catch(e){
//     print(e);
//   }
//   }

// //   void addOrder(List<CartItem> cartProducts, double total) {
// //     _orders.insert(
// //         0,
// //         Order(
// //             username: DateTime.now().toString(),
// //             products: cartProducts,
// //             amount: total,
// //             dateTime: DateTime.now(),  ));
// //     update();
// //   }
//  }