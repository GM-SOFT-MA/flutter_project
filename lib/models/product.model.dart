

class Product{
  final int id;
  final String name;
  final String price;
  final int quantity;
  final String components;

  Product({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.components
  });



  factory Product.fromJson(Map<String, dynamic> json) {

    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json["quantity"],
      components: json['components'],
    );
  }

  Map toJson() {
    return {'id': id, 'name': name, 'price': price, 'quantity': quantity, 'components': components};
  }
  String tostring(){
    String result = "$id  $name  $price $quantity $components";
    return result.toString();
  }
}

