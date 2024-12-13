import 'package:bloc_structure/features/cart/ui/cart.dart';
import 'package:bloc_structure/features/home/bloc/home_bloc.dart';
import 'package:bloc_structure/features/home/bloc/home_event.dart';
import 'package:bloc_structure/features/home/bloc/home_state.dart';
import 'package:bloc_structure/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeInitialState,
      listener: (context, state) {
        print('Listener state: $state'); // Debugging statement
        if (state is HomeWishlistButtonNavigationClickedState) {
          print('Navigating to Wishlist'); // Debugging statement
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        } else if (state is HomeShoppingCartButtonNavigationClickedState) {
          print('Navigating to Cart'); // Debugging statement
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>cart()));
        }
      },
      builder: (context, state) {
        print('Current state: $state'); // Debugging statement
        switch (state.runtimeType) {
          case HomeInitialState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final products = (state as HomeLoadedSuccessState).products;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.tealAccent,
                title: Text('Electrical Appliances'),
                actions: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeWishlistButtonNavigationClickedEvent());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_bag_outlined),
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeShoppingCartButtonNavigationClickedEvent());
                    },
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              products[index].imageUrl,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '\$${products[index].price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  products[index].category,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  products[index].description,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[800],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.favorite_border),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.shopping_bag_rounded),
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          case HomeErrorState:
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.tealAccent,
                title: Text('Electrical Appliances'),
                actions: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeWishlistButtonClickedEvent());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_bag_outlined),
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeShoppingCartButtonClickedEvent());
                    },
                  ),
                ],
              ),
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
        }
      },
    );
  }
}