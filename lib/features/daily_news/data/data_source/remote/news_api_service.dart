
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/utils/constants.dart';
import '../../models/article.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio,{String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getDailyNewsArticlesWithQueries(@Queries() Map<String, dynamic> queries);

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getDailyNewsArticles({
    @Query('apiKey') String? apiKey,
    @Query('country') String? country,
    @Query('category') String? category
    });
}