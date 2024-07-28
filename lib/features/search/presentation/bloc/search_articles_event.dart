abstract class SearchArticlesEvent{
  const SearchArticlesEvent();
}

class GetSearchedArticles extends SearchArticlesEvent{
  const GetSearchedArticles();
}

class ChangeCountry extends SearchArticlesEvent{
  final String country;
  const ChangeCountry(this.country);
}

class ChangeKeyWord extends SearchArticlesEvent{
  final String q;
  const ChangeKeyWord(this.q);
}