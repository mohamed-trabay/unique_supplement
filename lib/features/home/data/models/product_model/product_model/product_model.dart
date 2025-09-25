import 'package:equatable/equatable.dart';

import 'package:unique_supplement/features/home/data/models/product_model/product_model/category.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model/image.dart';

class ProductModel extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final String? permalink;
  final String? dateCreated;
  final String? dateModified;
  final String? type;
  final String? status;
  final String? description;
  final String? price;
  final String? regularPrice;
  final dynamic salePrice;
  final bool? onSale;
  final int? stockQuantity;
  final String? stockStatus;
  final List<Category>? categories;
  final List<ProductImage>? images;
  final List<int>? relatedIds;

  const ProductModel({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.dateModified,
    this.type,
    this.status,
    this.description,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.onSale,
    this.stockQuantity,
    this.stockStatus,
    this.categories,
    this.images,
    this.relatedIds,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    slug: json['slug'] as String?,
    permalink: json['permalink'] as String?,
    dateCreated: json['date_created'] as String?,
    dateModified: json['date_modified'] as String?,
    type: json['type'] as String?,
    status: json['status'] as String?,
    description: json['description'] as String?,
    price: json['price'] as String?,
    regularPrice: json['regular_price'] as String?,
    salePrice: json['sale_price'] as dynamic,
    onSale: json['on_sale'] as bool?,
    stockQuantity: json['stock_quantity'] as int?,
    stockStatus: json['stock_status'] as String?,
    categories:
        (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
    images:
        (json['images'] as List<dynamic>?)
            ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
            .toList(),
    relatedIds: json['related_ids'] as List<int>?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'slug': slug,
    'permalink': permalink,
    'date_created': dateCreated,
    'date_modified': dateModified,
    'type': type,
    'status': status,
    'description': description,
    'price': price,
    'regular_price': regularPrice,
    'sale_price': salePrice,
    'on_sale': onSale,
    'stock_quantity': stockQuantity,
    'stock_status': stockStatus,
    'categories': categories?.map((e) => e.toJson()).toList(),
    'images': images?.map((e) => e.toJson()).toList(),
    'related_ids': relatedIds,
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      slug,
      permalink,
      dateCreated,
      dateModified,
      type,
      status,
      description,
      price,
      regularPrice,
      salePrice,
      onSale,
      stockQuantity,
      stockStatus,
      categories,
      images,
      relatedIds,
    ];
  }
}
