class ProductModel {
  late int? id = 0;
  final String image;
  final String name;
  final String description;
  final double price;
  final int quantity;

  ProductModel(
      {required this.image,
      required this.name,
      required this.description,
      required this.price,
      required this.quantity});

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image = json['image'],
        name = json['name'],
        description = json['description'],
        price = json['price'],
        quantity = json['quantity'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'name': name,
        'description': description,
        'price': price,
        'quantity': quantity
      };

  @override
  String toString() {
    return "[ $id - $name - $image - $description - $price - $quantity ]";
  }
}
