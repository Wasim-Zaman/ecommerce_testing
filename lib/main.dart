import 'package:ecommerce_testing/cubits/category/categories_cubit.dart';
import 'package:ecommerce_testing/cubits/favorites/favorites_cubit.dart';
import 'package:ecommerce_testing/cubits/product/products_cubit.dart';
import 'package:ecommerce_testing/cubits/splash/splash_cubit.dart';
import 'package:ecommerce_testing/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoritesCubit()),
        BlocProvider(create: (context) => ProductsCubit()..fetchProducts()),
        BlocProvider(create: (context) => CategoriesCubit()..fetchCategories()),
      ],
      child: MaterialApp(
        title: 'My Store',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: BlocProvider(
          create: (context) => SplashCubit()..initializeApp(),
          child: const SplashScreen(),
        ),
      ),
    );
  }
}
