import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'features/daily_news/data/data_source/remote/news_api_service.dart';
import 'features/daily_news/data/repository/article_repository_iml.dart';
import 'features/daily_news/domain/repository/article_repository.dart';
import 'features/daily_news/domain/usecases/get_daily_news_articles.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'features/search/presentation/bloc/search_articles_bloc.dart';
import 'features/search/domain/usecases/search_articles.dart';

final instance = GetIt.instance;

Future initializeDependencies() async {
  instance.registerSingleton<Dio>(Dio());
  instance.registerSingleton<NewsApiService>(NewsApiService(instance()));
  instance.registerSingleton<ArticleRepository>(ArticleRepositoryIml(instance()));
  instance.registerSingleton<GetDailyNewsArticlesUseCase>(GetDailyNewsArticlesUseCase(instance()));
  instance.registerSingleton<SearchArticlesUseCase>(SearchArticlesUseCase(instance()));

  instance.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(instance()));
  instance.registerFactory<SearchArticlesBloc>(() => SearchArticlesBloc(instance()));
}
