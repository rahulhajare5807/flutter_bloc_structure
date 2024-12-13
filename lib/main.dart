import 'package:bloc_structure/pages/home/bloc/home_bloc.dart';
import 'package:bloc_structure/pages/home/ui/home.dart';
import 'package:bloc_structure/theme/theme_manager.dart';
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
      child: ValueListenableBuilder<ThemeData>(
        valueListenable: ThemeManager.themeNotifier,
        builder: (context, currentTheme, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: currentTheme,
            home: Home(),
          );
        },
      ),
    );
  }
}
