import '../../../../core/utils/data_state.dart';
import '../../../../core/utils/usecase.dart';
import '../entities/article.dart';
import '../repository/article_repository.dart';

class GetDailyNewsArticlesUseCase implements UseCase<DataState<List<ArticleEntity>>,void>{

  final ArticleRepository _articleRepository;

  GetDailyNewsArticlesUseCase(this._articleRepository);


  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getDailyNewsArticles();
  }

}