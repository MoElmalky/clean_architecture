import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../features/daily_news/data/data_source/remote/news_api_service.dart';
import '../../../../core/utils/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../features/daily_news/data/models/article.dart';
import '../../../../features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryIml implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryIml(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getDailyNewsArticles(String country) async {
    try {
      final response = await _newsApiService.getDailyNewsArticles(
          apiKey: abiKey, category: defaultCategory, country: country);
      return _getDataState(response);
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<List<ArticleModel>>> getDailyNewsArticlesWithQueries(
      Map<String, dynamic> queries) async {
    try {
      final response =
          await _newsApiService.getDailyNewsArticlesWithQueries(queries);

      return _getDataState(response);
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }

  DataState<List<ArticleModel>> _getDataState(
      HttpResponse<List<ArticleModel>> response) {
    if (response.response.statusCode == HttpStatus.ok) {
      return DataSuccess(response.data);
    } else {
      return DataFailed(DioException(
          requestOptions: response.response.requestOptions,
          response: response.response,
          error: response.response.statusMessage,
          type: DioExceptionType.badResponse,
          ));
    }
  }
}
