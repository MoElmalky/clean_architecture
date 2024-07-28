import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Newses'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'test');
          } ,
          child: const Icon(Icons.view_headline_sharp)),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.read<RemoteArticleBloc>().add(const GetDailyNewsArticles());
            },
            child: const Icon(Icons.refresh_sharp)),
          const SizedBox(height: 40,),
          BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
            builder: (context, state) {
              if (state is RemoteArticlesLoading) {
                return const Center(
                    child: Column(
                  children: [
                    CupertinoActivityIndicator(),
                    Text("Hello"),
                  ],
                ));
              } else if (state is RemoteArticleFailed) {
                return const Center(child: Icon(Icons.refresh_sharp));
              } else {
                return SizedBox(
                  height: 600,
                  child: ListView( 
                    children: [ 
                      ...state.articles!.map((article) => DailyNewsViewer(article: article))
                    ],
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
