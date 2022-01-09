class FoodData {
  final String? id;
  final String? name;
  final String? category;
  final String? imagePath;
  final num? price;
  final num? discount;
  final num? rating;
  final List<int>? preparationTime;
  // final String? descreption;
  // final String? country;
  FoodData({
    this.id,
    this.name,
    this.category,
    this.imagePath,
    this.discount,
    this.price,
    this.rating,
    this.preparationTime,
    // this.descreption,
    // this.country,
  });
  factory FoodData.fromJson(Map<String, dynamic> json) {
    print(json);
    return FoodData(
      id: json['id'],
      category: json['category'],
      discount: json['discount'],
      imagePath: json['img'],
      name: json['name'],
      preparationTime: List<int>.from(json['preparationTime'].map((e) => e)),
      price: json['price'],
      rating: json['rating'],
      // descreption: json['descreption'],
      // country: json['country'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "category": category,
      "discount": discount,
      "img": imagePath,
      "name": name,
      "preparationTime": List<dynamic>.from(preparationTime!.map((x) => x)),
      "price": price,
      "rating": rating,
      // "descreption":descreption,
      // "country":country
    };
  }
}
