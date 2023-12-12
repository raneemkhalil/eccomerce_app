import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/category_item_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoryItemModel categoryItem; 
  final int index;
  const CategoryItem({super.key, required this.categoryItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 160,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: CachedNetworkImage(
                    imageUrl: categoryItem.imgUrl,
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: index % 2 == 0 ? 25 : 240,
              child: Column(
                children: [
                  Text(
                    categoryItem.label,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${categoryItem.number} Products',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),        
      ],
    );
  }
}