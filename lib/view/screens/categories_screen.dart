import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/category/categories_cubit.dart';
import '../widgets/category_card.dart';
import '../widgets/search_text_field.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..fetchCategories(),
      child: const CategoriesView(),
    );
  }
}

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Search Bar
              SearchTextField(
                hintText: 'Search categories...',
                onChanged: (value) {
                  context.read<CategoriesCubit>().searchCategories(value);
                },
              ),
              const SizedBox(height: 8),
              // Results count
              BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  return Text(
                    '${state.filteredCategories.length} categories found',
                    style: TextStyle(color: Colors.grey[600]),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Categories Grid
              Expanded(
                child: BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    if (state.status == CategoriesStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.status == CategoriesStatus.error) {
                      return Center(child: Text(state.error!));
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.1,
                      ),
                      itemCount: state.filteredCategories.length,
                      itemBuilder: (context, index) {
                        final category = state.filteredCategories[index];
                        return CategoryCard(category: category);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
