

import 'dart:async';

import 'package:bloc_structure/data/wishlist_items.dart';
import 'package:bloc_structure/pages/wishlist/bloc/wishlist_event.dart';
import 'package:bloc_structure/pages/wishlist/bloc/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromCartEvent>(wishlistRemoveFromCartEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveFromCartEvent(
      WishlistRemoveFromCartEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
// emit()
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
