import 'package:clean_architecture/features/search/presentation/bloc/search_articles_bloc.dart';
import 'package:clean_architecture/features/search/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/article/remote/remote_article_state.dart';
import '../bloc/article/remote/remote_article_bloc.dart';
import '../widgets/daily_news_viewer.dart';
import '../bloc/article/remote/remote_article_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        shadowColor: Colors.black,
        surfaceTintColor: Colors.grey[800],
        scrolledUnderElevation: 5,
        centerTitle: true,
        title: const Text('Newses'),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.view_headline_sharp))),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'search');
          }, 
          icon: const Icon(Icons.search_sharp))
        ],
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
          if (state is RemoteArticlesLoading) {
            return const Center(child: RefreshProgressIndicator(
              color: Colors.white,
              strokeWidth: 4,
              indicatorPadding: EdgeInsets.all(5),
            ));
          } else if (state is RemoteArticleFailed) {
            return const Center(child: Icon(Icons.refresh_sharp));
          } else {
            return RefreshIndicator(
              displacement: 10,
              onRefresh: () async {
                return context
                    .read<RemoteArticleBloc>()
                    .add(GetDailyNewsArticles(context.watch<SearchArticlesBloc>().params['country']));
              },
              color: Colors.white,
              child: ListView(
                children: [
                  const SizedBox(height: 10,),
                  ...state.articles!
                      .map((article) => DailyNewsViewer(article: article))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
