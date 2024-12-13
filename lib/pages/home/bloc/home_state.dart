import 'package:bloc_structure/pages/home/models/product_data_model.dart';
import 'package:bloc_structure/theme/theme_manager.dart';
import 'package:flutter/material.dart';

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
class ThemeChangeState extends HomeActionState {
  final ThemeData selectedTheme;

  ThemeChangeState({required this.selectedTheme}){
    ThemeManager.themeNotifier.value = selectedTheme;
  }
}
