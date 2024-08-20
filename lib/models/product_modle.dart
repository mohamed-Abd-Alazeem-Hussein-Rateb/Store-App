class ProductModel {
  final String image;
  final String title; // تأكد من أن هذا يتطابق مع JSON
  final double price;
  final String description;
  final String category;
  final int id;
  final String? imageUrl; // `imageUrl` هو اسم الحقل في JSON، اجعل هذا اختياريًا

  ProductModel({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.id,
    this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['image'] ?? '', // القيمة الافتراضية
      title: json['title'] ?? '', // استخدم 'title' بدلاً من 'name'
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      id: json['id'] ?? 0,
      imageUrl: json['image'] ?? '', // تأكد من الحقل الذي ترغب في استخدامه
    );
  }

  String toString() {
    return 'ProductModel(id: $id, name: $title, price: $price, category: $category)';
  }
}
