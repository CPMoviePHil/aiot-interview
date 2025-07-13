import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'products/views/products_view.dart';

import 'bloc_observer.dart';
import 'colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App-Aiot demo",
      theme: ThemeData(
        primarySwatch: color0096D6,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: color0096D6,
          secondary: color0096D6,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: color0096D6,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: colorF5F5F5,
      ),
      home: const ProductListPage(),
    );
  }
}
