import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart';
import 'features/search/presentation/bloc/search_articles_bloc.dart';
import 'features/daily_news/presentation/pages/home.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'features/search/presentation/pages/test.dart';

Future main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteArticleBloc>(
          create: (context) => instance()..add(const GetDailyNewsArticles()),
        ),
        BlocProvider<SearchArticlesBloc>(
          create: (context) => instance(),
        ),
      ],
      child: MaterialApp(
        title: 'Clean',
        routes: {
          'home': (context) => const HomePage(),
          'test': (context) => const TestPage(),
        },
        theme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
