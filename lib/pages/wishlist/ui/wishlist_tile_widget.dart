import 'package:bloc_structure/pages/home/models/product_data_model.dart';
import 'package:bloc_structure/pages/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_structure/pages/wishlist/bloc/wishlist_event.dart';
import 'package:flutter/material.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;

  const WishlistTileWidget({
    super.key,
    required this.productDataModel,
    required this.wishlistBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                productDataModel.imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(width: 12),

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    productDataModel.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),

                  // Product Description
                  Text(
                    productDataModel.description,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Product Price
                  Text(
                    "\$${productDataModel.price.toString()}",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                  ),
                ],
              ),
            ),

            // Remove Button
            IconButton(
              onPressed: () {
                wishlistBloc.add(
                  WishlistRemoveFromCartEvent(productDataModel: productDataModel),
                );
              },
              icon: const Icon(Icons.remove_shopping_cart_outlined),
              color: Colors.red,
              tooltip: "Remove from Cart",
            ),
          ],
        ),
      ),
    );
  }
}
