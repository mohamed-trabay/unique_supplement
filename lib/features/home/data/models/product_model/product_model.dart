import 'package:unique_supplement/features/home/data/models/category_model.dart';

class ProductModel {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String price;
  final String regularPrice;
  final String salePrice;
  final bool onSale;
  final List<ProductImage> images;
  final List<CategoryModel> categories;

  ProductModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.onSale,
    required this.images,
    required this.categories,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      regularPrice: json['regular_price'] ?? '',
      salePrice: json['sale_price'] ?? '',
      onSale: json['on_sale'] ?? false,
      images:
          (json['images'] as List<dynamic>?)
              ?.map((img) => ProductImage.fromJson(img))
              .toList() ??
          [],
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((cat) => CategoryModel.fromJson(cat))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'price': price,
      'regular_price': regularPrice,
      'sale_price': salePrice,
      'on_sale': onSale,
      'images': images.map((e) => e.toJson()).toList(),
      'categories': categories.map((e) => e.toJson()).toList(),
    };
  }
}

class ProductImage {
  final int id;
  final String src;
  final String name;
  final String alt;

  ProductImage({
    required this.id,
    required this.src,
    required this.name,
    required this.alt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'] ?? 0,
      src: json['src'] ?? '',
      name: json['name'] ?? '',
      alt: json['alt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'src': src, 'name': name, 'alt': alt};
  }
}
