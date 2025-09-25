import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final int? parent;
  final String? description;
  final String? display;
  final String? image;
  final int? count;

  const Category({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.description,
    this.display,
    this.image,
    this.count,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json['id'] as int?,
    name: json['name'] as String?,
    slug: json['slug'] as String?,
    parent: json['parent'] as int?,
    description: json['description'] as String?,
    display: json['display'] as String?,
    image: json['image']?['src'] as String?, // null-safe
    count: json['count'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'slug': slug,
    'parent': parent,
    'description': description,
    'display': display,
    'image': image,
    'count': count,
  };

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    parent,
    description,
    display,
    image,
    count,
  ];
}
