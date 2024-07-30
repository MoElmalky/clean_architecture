import '../../../../core/utils/data_state.dart';
import '../../../../features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getDailyNewsArticles(String country);
  
  Future<DataState<List<ArticleEntity>>> getDailyNewsArticlesWithQueries(Map<String, dynamic> queries);
}
