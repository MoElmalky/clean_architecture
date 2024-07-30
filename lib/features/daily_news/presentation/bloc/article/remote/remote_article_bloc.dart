import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/data_state.dart';
import '../../../../domain/usecases/get_daily_news_articles.dart';
import 'remote_article_event.dart';
import 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetDailyNewsArticlesUseCase _articlesUseCase;

  RemoteArticleBloc(this._articlesUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetDailyNewsArticles>(onGetDailyNewsArticles);
  }

  void onGetDailyNewsArticles(
    GetDailyNewsArticles event, Emitter<RemoteArticleState> emit) async {
    emit(const RemoteArticlesLoading());
    final dataState = await _articlesUseCase(params: event.country);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticleFailed(dataState.error!));
    }
  }
}
