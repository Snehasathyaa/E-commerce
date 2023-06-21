class Product{
  final int   id;
  final String productTitle;
  final String imageUrl;
  final String description;
  final double price;
   bool isFavourite;

  Product(
      {required this.id,
      required this.productTitle,
      required this.imageUrl,
      required this.description,
      required this.price,
      this.isFavourite = false});


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      productTitle: json['productTitle'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      price: json['price'],
      //isFavourite: json['isFavourite'],
    );
  }

  
Map<String, dynamic> toJson() => {
  "id": id,
  "productTitle": productTitle,
  "imageUrl": imageUrl,
  "description": description,
  "price": price
  };

}