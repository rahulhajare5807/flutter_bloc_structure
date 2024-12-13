import 'package:bloc_structure/pages/home/models/product_data_model.dart';

abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent{
  
}


class WishlistRemoveFromCartEvent extends WishlistEvent {
  final ProductDataModel productDataModel;
  WishlistRemoveFromCartEvent({
    required this.productDataModel,
  });
}