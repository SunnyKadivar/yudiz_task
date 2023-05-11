
class Product {
  String name;
  int id;
  String description;
  double price;
  String image;

  Product({
    required this.name,
    required this.id,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    id: json["id"],
    description: json["description"],
    price: json["price"]?.toDouble(),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "description": description,
    "price": price,
    "image": image,
  };
}
