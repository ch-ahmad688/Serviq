class Model {
  final String id;
  final String image;
  final String name;
  final String? price;
  final String? rating;
  final String? category;

  Model({
    required this.id,
    required this.image,
    required this.name,
    this.price,
    this.rating,
    this.category,
  });
}