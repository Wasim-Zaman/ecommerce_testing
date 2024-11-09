import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/product/products_cubit.dart';
import '../../models/category_model.dart';
import '../widgets/product_card.dart';
import '../widgets/search_text_field.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  final Category category;

  const ProductsByCategoryScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = ProductsCubit();
        cubit.fetchProductsByCategory(category.slug);
        return cubit;
      },
      child: _ProductsByCategoryView(category: category),
    );
  }
}

class _ProductsByCategoryView extends StatelessWidget {
  final Category category;

  const _ProductsByCategoryView({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button and Title
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      category.name,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Search Bar
              SearchTextField(
                hintText: 'Search ${category.name.toLowerCase()}...',
                onChanged: (value) {
                  context.read<ProductsCubit>().searchProducts(value);
                },
              ),
              const SizedBox(height: 8),
              // Results count
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  return Text(
                    '${state.filteredProducts.length} results found',
                    style: TextStyle(color: Colors.grey[600]),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Products List
              Expanded(
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    if (state.status == ProductsStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.status == ProductsStatus.error) {
                      return Center(child: Text(state.error!));
                    }
                    return ListView.builder(
                      itemCount: state.filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = state.filteredProducts[index];
                        return ProductCard(product: product);
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
