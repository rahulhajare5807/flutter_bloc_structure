import 'package:bloc_structure/pages/home/bloc/home_bloc.dart';
import 'package:bloc_structure/pages/home/bloc/home_event.dart';
import 'package:bloc_structure/pages/home/models/product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  const ProductTileWidget({
    super.key,
    required this.productDataModel,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    // Access theme data
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: theme.cardColor, 
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    productDataModel.imageUrl,
                    height: 120,
                    width: 120,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(width: 12),
                // Expanded Column to allow multiline text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Name
                      Text(
                        productDataModel.name,
                        style: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor, // Use primary color
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Product Description
                      Text(
                        productDataModel.description,
                        style: theme.textTheme.bodySmall,
                        maxLines: 3, // Restrict to 3 lines
                        overflow: TextOverflow
                            .ellipsis, // Adds ellipsis at the end if text overflows
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            // Price and Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product Price
                Text(
                  "\$${productDataModel.price.toString()}",
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor, 
                  ),
                ),
                // Wishlist and Cart Buttons
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistButtonClickedEvent(
                            clickedProduct: productDataModel));
                      },
                      icon: const Icon(Icons.favorite_border),
                      color: theme.primaryColor, 
                    ),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonClickedEvent(
                            clickedProduct: productDataModel));
                      },
                      icon: const Icon(Icons.shopping_bag_outlined),
                      color: theme.hintColor, 
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
