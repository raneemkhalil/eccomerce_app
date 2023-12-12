import 'package:flutter/material.dart';

enum Size { S, M, L, XL }

class ProductItemModel {
  final String id;
  final String name;
  final String imgUrl;
  final bool isFavorite;
  final String description;
  final double price;
  final double quantityPrice;
  final String category;
  final int quantity;
  final Color color;
  final Size? size;
  final bool isAddedToCart;

 const ProductItemModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.isFavorite = false,
    this.description =
        'dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy  ',
    required this.price,
    required this.quantityPrice,
    required this.category,
    required this.quantity,
    this.color = const Color.fromARGB(255, 235, 232, 232),
    this.size,
    this.isAddedToCart=false,
  });

  ProductItemModel copyWith({
    String? id,
    String? name,
    String? imgUrl,
    bool? isFavorite,
    String? description,
    double? price,
    double? quantityPrice,
    String? category,
    int? quantity,
    Color? color,
    Size? size,
    bool? isAddedToCart,
  }) {
    return ProductItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      description: description ?? this.description,
      price: price ?? this.price,
      quantityPrice: quantityPrice ?? this.quantityPrice,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
      size: size ?? this.size,
      isAddedToCart: isAddedToCart ?? this.isAddedToCart,
    );
  }
}

List<ProductItemModel> dummyProducts = [
  const ProductItemModel(
    id: '1',
    name: 'name1',
    imgUrl:
        'https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm23525_29623_2.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    price: 8.1,
    category: 'clothes',
    isAddedToCart: true,
    quantity: 2,
    size: Size.L,
    quantityPrice:8.1,
  ),
  const ProductItemModel(
    id: '2',
    name: 'name2',
    imgUrl:
        'https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm31151_10729_2.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    price: 8.2,
    category: 'clothes',
    isAddedToCart: true,
    quantity: 2,
    size: Size.XL,
    quantityPrice:8.2,
  ),
  const ProductItemModel(
    id: '3',
    name: 'name3',
    imgUrl:
        'https://www.seasaltcornwall.com/media/catalog/product/b/-/b-wm31365-31866_2_4.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    price: 8.3,
    category: 'clothes',
    isAddedToCart: true,
    quantity: 3,
    size: Size.S,
    quantityPrice:8.3,
  ),
  const ProductItemModel(
    id: '4',
    name: 'name4',
    imgUrl:
        'https://www.seasaltcornwall.com/media/catalog/product/b/-/b-wm21498-14255_replace_2_22.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    price: 8.4,
    category: 'clothes',
    isAddedToCart: true,
    quantity: 5,
    quantityPrice:8.4,
  ),
  const ProductItemModel(
    id: '5',
    name: 'name5',
    imgUrl:
        'https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm31098_29875_2.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    price: 8.5,
    category: 'clothes',
    quantityPrice:8.5,
    quantity: 2,
     isAddedToCart: true,
  ),
  const ProductItemModel(
    id: '6',
    name: 'name6',
    imgUrl:
        'https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm31313_29627_2.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    price: 8.6,
    category: 'clothes',
    quantityPrice:8.6,
    quantity: 8,
     isAddedToCart: true,
  ),
];