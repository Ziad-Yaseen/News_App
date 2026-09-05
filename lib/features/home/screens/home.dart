import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/repositories/home_repository.dart';
import 'package:news_app/core/services/home_services.dart';
import 'package:news_app/features/home/controllers/home_controller.dart';
import 'package:news_app/features/home/widgets/categories_list_view.dart';
import 'package:news_app/features/home/widgets/home_app_bar.dart';
import 'package:news_app/core/components/news_content_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController(HomeRepository(HomeServices()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return Column(
            children: [
              Gap(AppSizes.height16),
              CategoriesListView(
                selectedCategoryId: _controller.selectedCategoryId,
                onCategorySelected: _controller.selectCategory,
              ),
              Gap(AppSizes.height24),
              Expanded(
                child: NewsContentView(
                  isSearch: false,
                  isLoading: _controller.isLoading,
                  errorMessage: _controller.errorMessage,
                  articles: _controller.articles,
                  onRetry: _controller.fetchArticles,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
