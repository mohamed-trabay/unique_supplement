import 'package:equatable/equatable.dart';

class ProductImage extends Equatable {
  final int? id;
  final String? src;
  final String? name;

  const ProductImage({this.id, this.src, this.name});

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    id: json['id'] as int?,
    src: json['src'] as String?,
    name: json['name'] as String?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'src': src, 'name': name};

  @override
  List<Object?> get props => [id, src, name];
}
