class HomeProductDataModel {
  final String id;
  final String name;
  final double price;
  final String category;
  final String description;
  final String imageUrl;

  HomeProductDataModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.category,
      required this.description,
      required this.imageUrl});
}
