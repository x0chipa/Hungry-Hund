class Furniture {
  String title;
  String description;
  double price;
  int quantity;
  double score;
  List<String> images;
  bool isFavorite;
  String category;  // Nuevo atributo agregado

  Furniture({
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
    required this.score,
    required this.images,
    this.isFavorite = false,
    required this.category,  // Nuevo parámetro en el constructor
  });
}
