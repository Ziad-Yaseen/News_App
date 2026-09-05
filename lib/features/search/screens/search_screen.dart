import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/components/news_content_view.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/repositories/search_repository.dart';
import 'package:news_app/core/services/search_services.dart';
import 'package:news_app/core/styles/text_styles.dart';
import 'package:news_app/features/search/controllers/search_controller.dart';
import 'package:news_app/features/search/widgets/custom_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final MySearchController _controller;
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _controller = MySearchController(SearchRepository(SearchServices()));
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gap(AppSizes.height32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                children: [
                  CustomTextField(
                    controller: _textController,
                    onSubmitted: (value) {
                      _controller.searchArticles(
                        value,
                      );
                    },
                  ),
                  Gap(AppSizes.width12),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Text('cancel'.tr(), style: AppTextStyles.cancel),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListenableBuilder(
                listenable: _controller,
                builder: (context, _) {
                  return NewsContentView(
                    isSearch: true,
                    isLoading: _controller.isLoading,
                    errorMessage: _controller.errorMessage,
                    articles: _controller.articles,
                    onRetry: _controller.retrySearch,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
