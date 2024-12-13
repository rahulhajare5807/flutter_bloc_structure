import 'package:bloc_structure/data/grocery_data.dart';
import 'package:bloc_structure/features/home/bloc/home_event.dart';
import 'package:bloc_structure/features/home/bloc/home_state.dart';
import 'package:bloc_structure/features/home/models/home_product_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    final groceryData = GroceryData();

    // Initial event
    on<HomeEvent>((event, emit) {
      emit(HomeInitialState());
    });

    // Loading state
    on<HomeInitialLoadEvent>((event, emit) async {
      emit(HomeInitialLoadState());
      await Future.delayed(Duration(seconds: 3));
      emit(HomeLoadedSuccessState(
        products: groceryData.groceryProducts
            .map((e) => HomeProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  price: e['price'],
                  category: e['category'],
                  description: e['description'],
                  imageUrl: e['imageUrl'],
                ))
            .toList(),
      ));
      print('HomeLoadedSuccessState emitted'); // Debugging statement
    });

    // Wishlist button clicked event
    on<HomeWishlistButtonNavigationClickedEvent>((event, emit) {
      print('Wishlist button clicked'); // Debugging statement
      _homeWishlistButtonClicked(emit);
    });

    // Shopping cart button clicked event
    on<HomeShoppingCartButtonNavigationClickedEvent>((event, emit) {
      print('Shopping cart button clicked'); // Debugging statement
      _homeShoppingCartButtonClickedEvent(emit);
    });
  }

  void _homeWishlistButtonClicked(Emitter<HomeState> emit) {
    print('Wishlist Navigation button clicked');
    emit(HomeWishlistButtonNavigationClickedState());
  }

  void _homeShoppingCartButtonClickedEvent(Emitter<HomeState> emit) {
    print('Shopping cart Navigation button clicked');
    emit(HomeShoppingCartButtonNavigationClickedState());
  }
}