import 'package:clean_architecture/features/search/presentation/widgets/custom_dropdown.dart';
import 'package:clean_architecture/features/search/presentation/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../daily_news/presentation/widgets/daily_news_viewer.dart';
import '../bloc/search_articles_bloc.dart';
import '../bloc/search_articles_event.dart';
import '../bloc/search_articles_state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = const [
      'general',
      'business',
      'entertainment',
      'sports',
      'technology',
      'health',
      'science'
    ];
    final searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        shadowColor: Colors.black,
        surfaceTintColor: Colors.grey[800],
        scrolledUnderElevation: 5,
        centerTitle: true,
        title: const Text('Newses'),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey[900]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 200,
                      child:
                          CustomSearchBar(searchController: searchController)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomDropdown(items: categories),
                )
              ],
            ),
          ),
          BlocBuilder<SearchArticlesBloc, SearchArticlesState>(
              builder: (context, state) {
            if (state is SearchArticlesLoading) {
              return const Expanded(
                child: Center(
                    child: RefreshProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4,
                  indicatorPadding: EdgeInsets.all(5),
                )),
              );
            } else if (state is SearchArticlesFailed) {
              return const Expanded(
                  child: Center(child: Icon(Icons.refresh_sharp)));
            } else {
              return Expanded(
                child: RefreshIndicator(
                  color: Colors.white,
                  displacement: 10,
                  onRefresh: () async => context
                      .read<SearchArticlesBloc>()
                      .add(const GetSearchedArticles()),
                  child: ListView(
                    children: [
                      ...state.articles!
                          .map((article) => DailyNewsViewer(article: article))
                    ],
                  ),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
