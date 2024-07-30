abstract class SearchArticlesEvent{
  const SearchArticlesEvent();
}

class GetSearchedArticles extends SearchArticlesEvent{
  const GetSearchedArticles();
}

class InitializeParameters extends SearchArticlesEvent{
  const InitializeParameters();
}

class ChangeCountry extends SearchArticlesEvent{
  final String country;

  const ChangeCountry(this.country);
}

class ChangeKeyWord extends SearchArticlesEvent{
  final String q;
  
  const ChangeKeyWord(this.q);
}

class ChangeCategory extends SearchArticlesEvent{
  final String category;

  ChangeCategory(this.category);
}