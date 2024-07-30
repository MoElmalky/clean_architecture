abstract class RemoteArticleEvent {
  const RemoteArticleEvent();
}

class GetDailyNewsArticles extends RemoteArticleEvent{
  final String country;
  const GetDailyNewsArticles(this.country);
}