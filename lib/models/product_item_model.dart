import 'package:flutter/material.dart';

class ProductItemModel {
  final String id;
  final String name;
  final String imgUrl;
  final bool isFavorite;
  final String description;
  final double price;
  final String category;
  final int quantity;
  final Color color;

  const ProductItemModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.isFavorite = false,
    this.description =
        'dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy ',
    required this.price,
    required this.category,
    required this.quantity,
    this.color = const Color.fromARGB(255, 235, 232, 232),
  });

  ProductItemModel copyWith({String? id, String? name, String? imgUrl, bool? isFavorite,
   String? description, double? price, String? category, int? quantity}){
    return ProductItemModel(id: id ?? this.id, name: name ?? this.name, imgUrl: imgUrl ?? this.imgUrl,
      isFavorite: isFavorite ?? this.isFavorite, description: description ?? this.description, price: price ?? this.price,
      category: category ?? this.category, quantity: quantity ?? this.quantity);
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
    quantity: 1,
  ),
  const ProductItemModel(
    id: '2',
    name: 'name2',
    imgUrl:
        'https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm31151_10729_2.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    price: 8.2,
    category: 'clothes',
    quantity: 1
  ),
  const ProductItemModel(
    id: '3',
    name: 'name3',
    imgUrl:
        'https://www.seasaltcornwall.com/media/catalog/product/b/-/b-wm31365-31866_2_4.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    price: 8.3,
    category: 'clothes',
    quantity: 1

  ),
  const ProductItemModel(
    id: '4',
    name: 'name4',
    imgUrl:
        'https://www.seasaltcornwall.com/media/catalog/product/b/-/b-wm21498-14255_replace_2_22.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    price: 8.4,
    category: 'clothes',
    quantity: 1
  ),
  const ProductItemModel(
    id: '5',
    name: 'name5',
    imgUrl:
        'https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm31098_29875_2.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    price: 8.5,
    category: 'clothes',
    quantity: 1
  ),
  const ProductItemModel(
    id: '6',
    name: 'name6',
    imgUrl:
        'https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm31313_29627_2.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795',
    price: 8.6,
    category: 'clothes',
    quantity: 1
  ),
];
