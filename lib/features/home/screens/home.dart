import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/components/loading_widget.dart';
import 'package:news_app/core/components/my_error_widget.dart';
import 'package:news_app/core/components/news_list_view.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/features/home/cubit/home_cubit.dart';
import 'package:news_app/features/home/cubit/home_states.dart';
import 'package:news_app/features/home/widgets/home_app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTopHeadlines();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: CustomScrollView(
        slivers: [
          // Gap(AppSizes.height16),
          // CategoriesListView(
          //   selectedCategoryId: _controller.selectedCategoryId,
          //   onCategorySelected: _controller.selectCategory,
          // ),
          // Gap(AppSizes.height24),
          // Expanded(
          //   child: NewsContentView(
          //     isSearch: false,
          //     isLoading: _controller.isLoading,
          //     errorMessage: _controller.errorMessage,
          //     articles: _controller.articles,
          //     onRetry: _controller.fetchArticles,
          //   ),
          // ),
          BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              if (state is LoadingTopHeadlinesState) {
                return const LoadingWidget();
              } else if (state is ErrorTopHeadlineState) {
                final msg = state.error.toLowerCase();
                final isNetworkError =
                    msg.contains('socket') || msg.contains('network');
                return MyErrorWidget(
                  isNetworkError: isNetworkError,
                  // fetchNews: onRetry,
                );
              } else if (state is SuccessHeadLineState) {
                List<ArticleModel> topHeadlinesModel = state.topHeadlines;
                return NewsListView(
                  articles: topHeadlinesModel,
                  isSearch: false,
                );
              }
              return const Center(child: Text('SomeThing Went Wrong'));
            },
          ),
        ],
      ),
    );
  }
}
