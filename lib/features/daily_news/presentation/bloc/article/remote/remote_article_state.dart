import 'package:dio/dio.dart';

import '../../../../domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

class RemoteArticlesSuccess extends RemoteArticleState {
  const RemoteArticlesSuccess(List<ArticleEntity> articles) : super(articles: articles);
}

class RemoteArticleFailed extends RemoteArticleState {
  const RemoteArticleFailed(DioException error) : super(error: error);
}
