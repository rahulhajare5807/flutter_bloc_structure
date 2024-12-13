import 'package:bloc_structure/pages/home/models/product_data_model.dart';

abstract class CartEvent {}

class CartInitialEvent extends CartEvent{
  
}


class CartRemoveFromCartEvent extends CartEvent {
  final ProductDataModel productDataModel;
  CartRemoveFromCartEvent({
    required this.productDataModel,
  });
}
