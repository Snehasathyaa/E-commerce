

import 'Cartitemmodel.dart';

class Order {
  final String username;
  final double amount;
  final List<CartItem> products;
  final String dateTime;

  Order(
      {required this.username,
      required this.amount,
      required this.products,
      required this.dateTime,
      });
      
     factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      username: json['id'],
      products: json['products'],
      amount: json['imageUrl'],
      dateTime: json['description']
      
    );
  }

  
Map<String, dynamic> toJson() => {
  "username": username,
  "products":products,
  "amount": amount,
  "dateTime": dateTime
  };
 
}