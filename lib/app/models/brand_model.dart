class BrandCard {
  final String name;
  final int products;
  final List<String> images;

  BrandCard({required this.name, required this.products, required this.images});

  factory BrandCard.fromMap(Map<String, dynamic> map) {
    return BrandCard(
      name: map['name'] ?? '',
      products: map['products'] ?? 0,
      images: List<String>.from(map['images'] ?? []),
    );
  }
}
