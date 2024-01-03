import "package:cached_network_image/cached_network_image.dart";
import "package:ecommerce/models/product_item_model.dart";
import "package:ecommerce/utils/colors_app.dart";
import "package:flutter/material.dart";

class ProductItemPaymentWidget extends StatelessWidget {
  final ProductItemModel item;
  const ProductItemPaymentWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row( 
        children: [ 
          SizedBox(
            height: 100,
            width: 100,
            child: ClipRRect (
              borderRadius: BorderRadius.circular(16.0), 
              child: CachedNetworkImage(imageUrl: item.imgUrl, fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text(item.name, style: Theme.of(context).textTheme.headlineSmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: [
                    if (item.size == null)
                      Text(
                        'No Size',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.grey
                        ),
                      ),
                    if(item.size != null)
                      Text.rich(
                        TextSpan(
                          text: 'Size: ',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.grey
                          ),
                          children: [
                            TextSpan(
                              text: item.size!.name,
                              style: Theme.of(context).textTheme.titleMedium
                            )
                          ]
                        )
                      ),
                    Text (
                      '${item.price}',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ]
                )
              ]
            ),
          ),
        ]
      ),
    );
  }
}