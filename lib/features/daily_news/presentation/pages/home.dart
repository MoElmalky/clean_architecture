import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/article/remote/remote_article_state.dart';
import '../bloc/article/remote/remote_article_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Newses'),
        leading: Icon(Icons.view_headline_sharp),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                  height: 500,
                  child: ListView.builder(
                      itemCount: state.articles!.length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              state.articles![i].urlToImage == null ? 
                              const CupertinoActivityIndicator()
                              :Image.network(state.articles![i].urlToImage!),
                              Text(state.articles![i].title!),
                            ],
                          ),
                        );
                      }),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
