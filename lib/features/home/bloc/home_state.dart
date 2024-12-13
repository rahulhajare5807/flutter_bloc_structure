import 'package:bloc_structure/features/home/models/home_product_data_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}
class HomeInitialLoadState extends HomeState {}

class HomeActionState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeWishlistButtonClickedState extends HomeState {}

class HomeShoppingCartButtonClickedState extends HomeState {}

class HomeWishlistButtonNavigationClickedState extends HomeActionState {}

class HomeShoppingCartButtonNavigationClickedState extends HomeActionState {}

class HomeLoadedSuccessState extends HomeState {
  final List<HomeProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}
