import 'package:clean_architecture/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/utils/data_state.dart';
import '../../../../core/utils/usecase.dart';
import '../../../daily_news/domain/entities/article.dart';

class SearchArticlesUseCase implements UseCase<DataState<List<ArticleEntity>>,Map<String,dynamic>>{
  final ArticleRepository _articleRepository;

  SearchArticlesUseCase(this._articleRepository);

  
  @override
  Future<DataState<List<ArticleEntity>>> call({required Map<String, dynamic> params}) {
    return _articleRepository.getDailyNewsArticlesWithQueries(params);
  }

}