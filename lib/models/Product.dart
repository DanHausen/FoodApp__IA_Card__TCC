class Product {
  final String name;
  final String id;
  final String filtros;
  final String description;
  final String image;
  final String price;
  final key;

  const Product({
    required this.name,
    required this.filtros,
    required this.id,
    required this.description,
    required this.image,
    required this.price,
    this.key,
  });
}
