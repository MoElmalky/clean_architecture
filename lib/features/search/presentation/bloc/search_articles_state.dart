import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../daily_news/domain/entities/article.dart';

abstract class SearchArticlesState extends Equatable{
  final List<ArticleEntity>? articles;
  final DioException? error;

  const SearchArticlesState({this.articles, this.error});

  @override
  List<Object?> get props => [articles, error];
}

class SearchArticlesLoading extends SearchArticlesState{
  const SearchArticlesLoading();
}

class SearchArticlesSuccess extends SearchArticlesState{
  const SearchArticlesSuccess(List<ArticleEntity> articles) : super(articles: articles);
}

class SearchArticlesFailed extends SearchArticlesState{
  const SearchArticlesFailed(DioException error) : super(error: error);
}