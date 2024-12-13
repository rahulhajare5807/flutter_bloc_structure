import 'package:bloc_structure/features/home/bloc/home_bloc.dart';
import 'package:bloc_structure/features/home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          textTheme: TextTheme(
            titleLarge: TextStyle(fontSize: 20,color: Colors.white),
          ),
        ),
        home: Home(),
      ),
    );
  }
}
