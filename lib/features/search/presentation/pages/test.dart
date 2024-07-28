import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../daily_news/presentation/widgets/daily_news_viewer.dart';
import '../bloc/search_articles_bloc.dart';
import '../bloc/search_articles_state.dart';
import '../bloc/search_articles_event.dart';
import '../widgets/custom_search_bar.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Newses'),
      ),
      body: ListView(
        children: [
          GestureDetector(
              onTap: () {
                context.read<SearchArticlesBloc>().add(const GetSearchedArticles());
              },
              child: const Icon(Icons.refresh_sharp)),
          CustomSearchBar(
            searchController: searchController,
          ),
          BlocBuilder<SearchArticlesBloc, SearchArticlesState>(
              builder: (context, state) {
            if (state is SearchArticlesLoading) {
              return const Center(
                  child: Column(
                children: [
                  CupertinoActivityIndicator(),
                  Text("Hello"),
                ],
              ));
            } else if (state is SearchArticlesFailed) {
              return const Center(child: Icon(Icons.refresh_sharp));
            } else {
              return SizedBox(
                height: 600,
                child: ListView(
                  children: [
                    ...state.articles!
                        .map((article) => DailyNewsViewer(article: article))
                  ],
                ),
              );
            }
          })
        ],
      ),
    );
  }
}
