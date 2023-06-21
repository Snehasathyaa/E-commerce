class CartItem {
  final int id;
  final String productTitle;
  final int productQuantity;
  final double productPrice;

  CartItem(
      {required this.id,
      required this.productTitle,
      required this.productQuantity,
      required this.productPrice});

  
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productTitle: json['productTitle'],
      productQuantity: json['productQuantity'],
      productPrice: json['productPrice']
      
    );
  }

  
Map<String, dynamic> toJson() => {
  "id": id,
  "productTitle": productTitle,
  "productQuantity": productQuantity,
  "productPrice": productPrice
  };    
}
