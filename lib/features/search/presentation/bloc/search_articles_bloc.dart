import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/search_articles.dart';
import '../../../../core/utils/data_state.dart';
import '../../../../core/utils/constants.dart';
import 'search_articles_event.dart';
import 'search_articles_state.dart';

class SearchArticlesBloc extends Bloc<SearchArticlesEvent,SearchArticlesState>{

  final SearchArticlesUseCase _searchArticles;

  Map<String,dynamic> params = {
    'apiKey' : abiKey,
    'country' : defaultCountry,
    'category' : '',
    'q' : '',
    'pageSize' : 10,
    'page' : 1
  };

  SearchArticlesBloc(this._searchArticles) : super(const SearchArticlesLoading()){

    on<GetSearchedArticles> (onGetSearchedArticles);

    on<ChangeCountry> ((event, emit) {
      params['country'] = event.country;
    });

    on<ChangeKeyWord> ((event, emit) {
      params['q'] = event.q;
    });

  }

  void onGetSearchedArticles(GetSearchedArticles event,Emitter<SearchArticlesState> emit) async {
    emit(const SearchArticlesLoading());
    final dataState = await _searchArticles(params: params);

    if(dataState is DataSuccess){
      emit(SearchArticlesSuccess(dataState.data!));
    }

    if(dataState is DataFailed){
      emit(SearchArticlesFailed(dataState.error!));
    }
  }

}